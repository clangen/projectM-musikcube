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
#include <projectM.hpp>
#include "sdltoprojectM.h"
#include <SDL_opengl.h>

void renderLoop(projectM *pm, SDL_Window* screen) {
    int i;
    int x, y;
    int index;
    short pcm_data[2][512];

    while (true) {
        projectMEvent evt;
        projectMKeycode key;
        projectMModifier mod;

        /** Process SDL events */
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            /** Translate into projectM codes and process */
            evt = sdl2pmEvent(event);
            key = sdl2pmKeycode(event.key.keysym.sym);
            mod = sdl2pmModifier(event.key.keysym.mod);

            if (evt == PROJECTM_KEYDOWN) {
                pm->key_handler( evt, key, mod );
            }
        }

        /** Produce some fake PCM data to stuff into projectM */
        for (i = 0 ; i < 512 ; i++) {
            if (i % 2 == 0) {
                pcm_data[0][i] = (float) (rand() / ((float) RAND_MAX ) * (pow(2,14)));
                pcm_data[1][i] = (float) (rand() / ((float) RAND_MAX ) * (pow(2,14)));
            }
            else {
                pcm_data[0][i] = (float) (rand() / ((float )RAND_MAX ) * (pow(2,14)));
                pcm_data[1][i] = (float) (rand() / ((float) RAND_MAX ) * (pow(2,14)));
            }

            if (i % 2 == 1) {
                pcm_data[0][i] = -pcm_data[0][i];
                pcm_data[1][i] = -pcm_data[1][i];
            }
        }

        pm->pcm()->addPCM16(pcm_data);
        pm->renderFrame();

        SDL_GL_SwapWindow(screen);
      }

    printf("Worker thread: Exiting\n");
}


int main(int argc, char *argv[]) {
    projectM *pm = NULL;
    SDL_Window *screen = NULL;
    int fullscreen = 0;
    int width = 784;
    int height = 784;
    int flags = 0;

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        return PROJECTM_ERROR;
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
        return PROJECTM_ERROR;
    }

    pm = new projectM("z:\\src\\projectM.inp");
    pm->projectM_resetGL( width, height );

    renderLoop(pm, screen);

    return PROJECTM_SUCCESS;
}
