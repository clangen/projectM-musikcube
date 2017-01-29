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

#ifdef WIN32
    #include <shlwapi.h>
    #include <SDL_opengl.h>
    #define DLL_EXPORT __declspec(dllexport)
#else
    #include <SDL2/SDL_opengl.h>
    #include <unistd.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <fstream>
    #define DLL_EXPORT
#endif

#include <projectM.hpp>

#include <core/sdk/constants.h>
#include <core/sdk/IPcmVisualizer.h>
#include <core/sdk/IPlugin.h>

#include "Utility.h"
#include "EventMapper.h"

#define MAX_FPS 30LL
#define MILLIS_PER_FRAME (1000LL / MAX_FPS)

#ifndef WIN32
#define COMPILE_AS_EXE
#endif

using namespace std::chrono;

static projectM* pm = nullptr;
static std::atomic<bool> quit(false);
static std::atomic<bool> thread(false);
static std::mutex pmMutex, threadMutex;
static std::condition_variable threadCondition;

#ifndef WIN32
    static const int MAX_SAMPLES = 1024;
    static const char* PCM_PIPE = "/tmp/musikcube_pcm.pipe";

    static void pipeReadProc() {
        float samples[MAX_SAMPLES];
        int count = 0;

        while (!quit.load()) {
            mkfifo(PCM_PIPE, 0666);
            std::cerr << "pipeReadProc: opening pipe...\n";
            int pipeFd = open(PCM_PIPE, O_RDONLY);
            std::cerr << "pipeReadProc: open returned\n";

            if (pipeFd > 0) {
                std::cerr << "pipeReadProc: pipe stream opened fd=" << pipeFd << "\n";

                bool pipeOpen = true;

                while (pipeFd > 0) {
                    int count = read(pipeFd, (void *)&samples, MAX_SAMPLES * sizeof(float));
                    if (count > 0) {
                        std::unique_lock<std::mutex> lock(pmMutex);
                        if (pm) {
                            pm->pcm()->addPCMfloat(samples, count / sizeof(float));
                        }
                    }
                    else {
                        close(pipeFd);
                        pipeFd = 0;
                    }
                }
            }
        } /* while (!quit) */

        std::cerr << "pipeReadProc: done\n";
    }
#endif

static void windowProc() {
    SDL_Event event;
    SDL_GLContext glContext = nullptr;
    SDL_Window* screen = nullptr;

    projectMEvent evt;
    projectMKeycode key;
    projectMModifier mod;

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

            if (!pm) {
                std::string configFn = GetProjectMDataDirectory() + "\\config.inp";
                pm = new projectM(configFn);
                pm->projectM_resetGL(width, height);
            }

            recreate = false;
        }

        while (SDL_PollEvent(&event)) {
            evt = sdl2pmEvent(event);
            key = sdl2pmKeycode(event.key.keysym.sym);
            mod = sdl2pmModifier(event.key.keysym.mod);

            if (event.type == SDL_WINDOWEVENT) {
                if (event.window.event == SDL_WINDOWEVENT_CLOSE) {
                    quit.store(true);
                    continue;
                }
            }

            if (evt == PROJECTM_KEYDOWN) {
                if (event.key.keysym.sym == SDLK_SPACE) {
                    /* hack: spacebar locks. */
                    pm->key_handler(evt, PROJECTM_K_l, mod);
                }
                else if (key == PROJECTM_K_f) {
                    if (!fullscreen) {
                        SDL_GetWindowPosition(screen, &x, &y);
                        SDL_GetWindowSize(screen, &width, &height);
                    }

                    fullscreen = !fullscreen;
                    recreate = true;
                }
                else if (key == PROJECTM_K_ESCAPE) {
                    quit.store(true);
                    continue;
                }
                else {
                    pm->key_handler(evt, key, mod);
                }
            }
            else if (evt == PROJECTM_VIDEORESIZE) {
                SDL_GetWindowSize(screen, &width, &height);
                pm->projectM_resetGL(width, height);
                pm->projectM_resetTextures();
            }
        }

        pm->renderFrame();

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
        delete pm;
        pm = nullptr;
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
        SetProjectMDataDirectory(util::getModuleDirectory());

#ifndef WIN32
        std::thread background(pipeReadProc);
        background.detach();
#endif

        quit.store(false);
        thread.store(true);
        windowProc();

        return 0;
    }
#else
    #ifdef WIN32
        BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved) {
            if (reason == DLL_PROCESS_ATTACH) {
                SetProjectMDataDirectory(util::getModuleDirectory(hModule));
            }
            return true;
        }
    #endif
#endif

#ifdef WIN32
    class VisualizerPlugin : public musik::core::sdk::IPlugin {
        public:
            virtual void Destroy() { delete this; }
            virtual const char* Name() { return "projectM IPcmVisualizer"; }
            virtual const char* Version() { return "0.3.1"; }
            virtual const char* Author() { return "clangen"; }
            virtual int SdkVersion() { return musik::core::sdk::SdkVersion; }
    };

    class Visualizer : public musik::core::sdk::IPcmVisualizer {
        public:
            virtual const char* Name() {
                return "projectM";
            }

            virtual void Destroy() {
                this->Hide();
                delete this;
            }

            virtual void Write(musik::core::sdk::IBuffer* buffer) {
                if (Visible()) {
                    std::unique_lock<std::mutex> lock(pmMutex);
                    if (pm) {
                        pm->pcm()->addPCMfloat(buffer->BufferPointer(), buffer->Samples());
                    }
                }
            }

            virtual void Show() {
                if (!Visible()) {
                    quit.store(false);
                    thread.store(true);
                    std::thread background(windowProc);
                    background.detach();
                }
            }

            virtual void Hide() {
                if (Visible()) {
                    quit.store(true);

                    while (thread.load()) {
                        std::unique_lock<std::mutex> lock(threadMutex);
                        threadCondition.wait(lock);
                    }
                }
            }

            virtual bool Visible() {
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
