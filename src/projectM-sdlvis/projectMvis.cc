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

#include <projectM.hpp>

#include <sdk/IPcmVisualizer.h>
#include <sdk/IPlugin.h>

#include "sdltoprojectM.h"

static projectM* pm = nullptr;
static SDL_Window* screen = nullptr;
static bool initialized = false;

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
        flags = SDL_WINDOW_OPENGL;
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

    SDL_GL_CreateContext(screen);

    if (screen == NULL) {
        return;
    }

    pm = new projectM("z:\\src\\projectM.inp");
    pm->projectM_resetGL(width, height);

    while (true) {
        projectMEvent evt;
        projectMKeycode key;
        projectMModifier mod;

        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            evt = sdl2pmEvent(event);
            key = sdl2pmKeycode(event.key.keysym.sym);
            mod = sdl2pmModifier(event.key.keysym.mod);

            if (evt == PROJECTM_KEYDOWN) {
                pm->key_handler(evt, key, mod);
            }
        }

        pm->renderFrame();
        SDL_GL_SwapWindow(screen);
    }

    printf("Worker thread: Exiting\n");
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD ul_reason_for_call, LPVOID lpReserved) {
    if (ul_reason_for_call == DLL_PROCESS_ATTACH) {
        _beginthread(threadProc, 0, 0);
    }
    return true;
}

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
            delete this;
        }

        virtual void Write(musik::core::audio::IBuffer* buffer) {
            if (pm) {
                pm->pcm()->addPCMfloat(buffer->BufferPointer(), buffer->Samples());
            }
        }
};

extern "C" __declspec(dllexport) musik::core::IPlugin* GetPlugin() {
    return new Plugin();
}

extern "C" __declspec(dllexport) musik::core::audio::IPcmVisualizer* GetPcmVisualizer() {
    return new Visualizer();
}