/**
 * projectM -- Milkdrop-esque visualisation SDK
 * Copyright (C)2003-2004 projectM Team
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * See 'LICENSE.txt' included within this release
 *
 */

#include <math.h>

#include <thread>
#include <mutex>
#include <condition_variable>
#include <atomic>
#include <chrono>
#include <iostream>

#include <SDL2/SDL_opengl.h>
#include <SDL2/SDL.h>

#ifdef WIN32
    #include <shlwapi.h>
    #define DLL_EXPORT __declspec(dllexport)
#else
    #include <unistd.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <fstream>
    #define DLL_EXPORT
#endif

#include <libprojectM/projectM.h>
#include <libprojectM/playlist.h>

#include <musikcore/sdk/constants.h>
#include <musikcore/sdk/IPcmVisualizer.h>
#include <musikcore/sdk/IPlugin.h>

#include "Utility.h"
#include "EventMapper.h"

#define MAX_FPS 60LL
#define MILLIS_PER_FRAME (1000LL / MAX_FPS)

using namespace std::chrono;

static projectm_handle projectM = nullptr;
static projectm_playlist_handle projectMPlaylist = nullptr;
static std::atomic<bool> quit(false);
static std::atomic<bool> thread(false);
static std::mutex pmMutex, threadMutex;
static std::condition_variable threadCondition;

static void windowProc() {
    SDL_Event event;
    SDL_GLContext glContext = nullptr;
    SDL_Window* screen = nullptr;

    //projectMEvent evt;
    //projectMKeycode key;
    //projectMModifier mod;

    long long start, end;
    bool recreate = true;
    bool fullscreen = false;
    int width = 784;
    int height = 784;
    int flags = 0;
    int x = SDL_WINDOWPOS_UNDEFINED;
    int y = SDL_WINDOWPOS_UNDEFINED;

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        goto cleanup;
    }

    while (!quit.load()) {
        auto start = system_clock::now();

        if (recreate) {
            if (glContext) {
                SDL_GL_DeleteContext(glContext);
            }

            if (screen) {
                SDL_DestroyWindow(screen);
            }

            SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE, 8);
            SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 16);
            SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

            if (fullscreen) {
                flags = SDL_WINDOW_OPENGL | SDL_WINDOW_FULLSCREEN;
            }
            else {
                flags = SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE;
            }

            screen = SDL_CreateWindow(
                "projectM", x, y, width, height, flags);

            glContext = SDL_GL_CreateContext(screen);


            projectM = projectm_create();
            projectm_set_window_size(projectM, width, height);
            projectm_set_fps(projectM, MAX_FPS);
            projectm_set_mesh_size(projectM, 220, 125);
            projectm_set_aspect_correction(projectM, true);
            projectm_set_preset_duration(projectM, 5);
            projectm_set_soft_cut_duration(projectM, 3);
            projectm_set_hard_cut_enabled(projectM, false);
            projectm_set_hard_cut_duration(projectM, 20);
            projectm_set_hard_cut_sensitivity(projectM, 1.0);
            projectm_set_beat_sensitivity(projectM, 1.0);

            const std::string presetPath = util::getModuleDirectory();
            projectMPlaylist = projectm_playlist_create(projectM);
            projectm_playlist_set_shuffle(projectMPlaylist, true);
            projectm_playlist_add_path(projectMPlaylist, presetPath.c_str(), true, false);
            int count = projectm_playlist_size(projectMPlaylist);
            projectm_playlist_sort(projectMPlaylist, 0, projectm_playlist_size(projectMPlaylist), SORT_PREDICATE_FILENAME_ONLY, SORT_ORDER_ASCENDING);

            recreate = false;
        }

        while (SDL_PollEvent(&event)) {
            //evt = sdl2pmEvent(event);
            //key = sdl2pmKeycode(event.key.keysym.sym);
            //mod = sdl2pmModifier(event.key.keysym.mod);

            //if (event.type == SDL_WINDOWEVENT) {
            //    if (event.window.event == SDL_WINDOWEVENT_CLOSE) {
            //        quit.store(true);
            //        continue;
            //    }
            //}

            //if (evt == PROJECTM_KEYDOWN) {
            //    if (event.key.keysym.sym == SDLK_SPACE) {
            //        /* hack: spacebar locks. */
            //        pm->key_handler(evt, PROJECTM_K_l, mod);
            //    }
            //    else if (key == PROJECTM_K_f) {
            //        if (!fullscreen) {
            //            SDL_GetWindowPosition(screen, &x, &y);
            //            SDL_GetWindowSize(screen, &width, &height);
            //        }

            //        fullscreen = !fullscreen;
            //        recreate = true;
            //    }
            //    else if (key == PROJECTM_K_ESCAPE) {
            //        quit.store(true);
            //        continue;
            //    }
            //    else {
            //        pm->key_handler(evt, key, mod);
            //    }
            //}
            if (event.type == SDL_WINDOWEVENT) {
                SDL_GetWindowSize(screen, &width, &height);
                projectm_set_window_size(projectM, width, height);
                projectm_reset_textures(projectM);
            }
        }

        try {
            projectm_opengl_render_frame(projectM);
        }
        catch (...) {
            /* if the selected preset throws an exception, cut over to the next
            one immediately. */
            projectm_playlist_play_next(projectMPlaylist, true);
        }

        SDL_GL_SwapWindow(screen);

        auto end = system_clock::now();
        auto delta = duration_cast<milliseconds>(end - start);
        long long waitTime = MILLIS_PER_FRAME - (delta.count());
        if (waitTime > 0) {
            util::sleep(waitTime);
        }
    }

    {
        std::unique_lock<std::mutex> lock(pmMutex);
        projectm_destroy(projectM);
        projectm_playlist_destroy(projectMPlaylist);
        projectM = nullptr;
        projectMPlaylist = nullptr;
    }

    SDL_GL_DeleteContext(glContext);
    SDL_DestroyWindow(screen);
    SDL_Quit();

cleanup:
    thread.store(false);

    {
        std::unique_lock<std::mutex> lock(threadMutex);
        threadCondition.notify_all();
    }
}

#ifdef COMPILE_AS_EXE
    int main(int argc, char *argv[]) {
        //SetProjectMDataDirectory(util::getModuleDirectory());
        quit.store(false);
        thread.store(true);
        windowProc();
        return 0;
    }
#else
    #ifdef WIN32
        BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved) {
            if (reason == DLL_PROCESS_ATTACH) {
                //SetProjectMDataDirectory(util::getModuleDirectory(hModule));
            }
            return true;
        }
    #endif
#endif

#ifdef WIN32
    class VisualizerPlugin : public musik::core::sdk::IPlugin {
        public:
            virtual void Release() override { delete this; }
            virtual const char* Name() override { return "projectM IPcmVisualizer"; }
            virtual const char* Version() override { return "0.5.2"; }
            virtual const char* Author() override { return "clangen"; }
            virtual const char* Guid() override { return "1e4b1884-65dd-4010-84a5-7c0f5732f343"; }
            virtual bool Configurable() override { return false; }
            virtual void Configure() override { }
            virtual void Reload() override { }
            virtual int SdkVersion() override { return musik::core::sdk::SdkVersion; }
    };

    class Visualizer : public musik::core::sdk::IPcmVisualizer {
        public:
            virtual const char* Name() override {
                return "projectM";
            }

            virtual void Release() override {
                this->Hide();
                delete this;
            }

            virtual void Write(musik::core::sdk::IBuffer* buffer) override {
                if (Visible()) {
                    std::unique_lock<std::mutex> lock(pmMutex);
                    if (projectM) {
                        const auto channels = buffer->Channels();
                        projectm_pcm_add_float(
                            projectM,
                            buffer->BufferPointer(),
                            buffer->Samples() / channels,
                            channels == 1 ? PROJECTM_MONO : PROJECTM_STEREO);
                    }
                }
            }

            virtual void Show() override {
                if (!Visible()) {
                    quit.store(false);
                    thread.store(true);
                    std::thread background(windowProc);
                    background.detach();
                }
            }

            virtual void Hide() override {
                if (Visible()) {
                    quit.store(true);

                    while (thread.load()) {
                        std::unique_lock<std::mutex> lock(threadMutex);
                        threadCondition.wait(lock);
                    }
                }
            }

            virtual bool Visible() override {
                return thread.load();
            }
    };

    extern "C" DLL_EXPORT musik::core::sdk::IPlugin* GetPlugin() {
        return new VisualizerPlugin();
    }

    extern "C" DLL_EXPORT musik::core::sdk::IPcmVisualizer* GetPcmVisualizer() {
        return new Visualizer();
    }
#endif
