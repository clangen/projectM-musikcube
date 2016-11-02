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
#include <SDL_opengl.h>

#include <atomic>
#include <chrono>

#include <projectM.hpp>

#include <sdk/IPcmVisualizer.h>
#include <sdk/IPlugin.h>

#include "EventMapper.h"

#ifdef WIN32
#include <shlwapi.h>
#endif

#define MAX_FPS 30LL
#define MILLIS_PER_FRAME (1000LL / MAX_FPS)

using namespace std::chrono;

static projectM* pm = nullptr;
static SDL_Window* screen = nullptr;
static std::atomic<bool> initialized = false;
static std::atomic<bool> quit = false;
static std::atomic<HANDLE> thread = nullptr;

#ifdef WIN32
static void setupDataDirectory(HMODULE module) {
    char path[2048];
    int length = GetModuleFileName(module, path, 2048);
    if (length > 0 && length <= 2048) {
        if (PathRemoveFileSpec(path)) {
            SetProjectMDataDirectory(std::string(path));
        }
    }
}

static void compactHeaps() {
    HANDLE heaps[128];
    int heapCount = GetProcessHeaps(128, heaps);
    for (int i = 0; i < heapCount; i++) {
        HeapCompact(heaps[i], 0);
    }
}
#endif

static void threadProc(void* unused) {
    int fullscreen = 0;
    int width = 784;
    int height = 784;
    int flags = 0;

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        return;
    }

    SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 16);
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

    if (fullscreen == 0) {
        flags = SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE;
    }
    else {
        flags = SDL_WINDOW_OPENGL | SDL_WINDOW_FULLSCREEN;
    }

    screen =
        SDL_CreateWindow(
            "projectM",
            SDL_WINDOWPOS_UNDEFINED,
            SDL_WINDOWPOS_UNDEFINED,
            width,
            height,
            flags);

    SDL_GLContext glContext = SDL_GL_CreateContext(screen);

    if (screen == NULL) {
        return;
    }

    std::string configFn = GetProjectMDataDirectory() + "\\config.inp";
    pm = new projectM(configFn);
    pm->projectM_resetGL(width, height);

    projectMEvent evt;
    projectMKeycode key;
    projectMModifier mod;
    SDL_Event event;
    long long start, end;

    while (!quit) {
        auto start = system_clock::now();

        while (SDL_PollEvent(&event)) {
            evt = sdl2pmEvent(event);
            key = sdl2pmKeycode(event.key.keysym.sym);
            mod = sdl2pmModifier(event.key.keysym.mod);

            if (event.type == SDL_WINDOWEVENT) {
                if (event.window.event == SDL_WINDOWEVENT_CLOSE) {
                    quit = true;
                    continue;
                }
            }

            if (evt == PROJECTM_KEYDOWN) {
                if (event.key.keysym.sym == SDLK_SPACE) {
                    /* hack: spacebar locks. */
                    pm->key_handler(evt, PROJECTM_K_l, mod);
                }
                else if (key == PROJECTM_K_ESCAPE) {
                    quit = true;
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
            Sleep(waitTime);
        }
    }

    delete pm;
    pm = nullptr;

    SDL_GL_DeleteContext(glContext);
    SDL_DestroyWindow(screen);
    screen = nullptr;
    thread = nullptr;

#ifdef WIN32
    compactHeaps();
#endif
}

#ifdef WIN32
#if true
BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved) {
    if (reason == DLL_PROCESS_ATTACH) {
        setupDataDirectory(hModule);
    }
    return true;
}
#else
int main(int argc, char *argv[]) {
    setupDataDirectory(NULL);
    quit = false;
    thread = (HANDLE)_beginthread(threadProc, 0, 0);
    WaitForSingleObject(thread, INFINITE);
    return 0;
}
#endif
#endif

class Plugin : public musik::core::IPlugin {
public:
    virtual void Destroy() { delete this; };
    virtual const char* Name() { return "projectM IPcmVisualizer"; };
    virtual const char* Version() { return "0.1"; };
    virtual const char* Author() { return "clangen"; };
};

class Visualizer : public musik::core::audio::IPcmVisualizer {
    public:
        virtual void Destroy() {
            this->Hide();
            delete this;
        }

        virtual void Write(musik::core::audio::IBuffer* buffer) {
            if (Visible() && pm) {
                pm->pcm()->addPCMfloat(buffer->BufferPointer(), buffer->Samples());
            }
        }

        virtual void Show() {
            if (!Visible()) {
                quit = false;
                thread = (HANDLE) _beginthread(threadProc, 0, 0);
            }
        }

        virtual void Hide() {
            if (Visible()) {
                quit = true;
                WaitForSingleObject(thread, INFINITE);
                thread = nullptr;
                quit = false;
            }
        }

        virtual bool Visible() {
            return (thread != nullptr);
        }
};

extern "C" __declspec(dllexport) musik::core::IPlugin* GetPlugin() {
    return new Plugin();
}

extern "C" __declspec(dllexport) musik::core::audio::IPcmVisualizer* GetPcmVisualizer() {
    return new Visualizer();
}