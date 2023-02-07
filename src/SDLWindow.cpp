#include "SDLWindow.h"

using namespace musikcube::projectm;

#include <math.h>

#include "Utility.h"

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

#define MAX_FPS 60LL
#define MILLIS_PER_FRAME (1000LL / MAX_FPS)

using namespace std::chrono;

static projectm_handle projectM = nullptr;
static projectm_playlist_handle projectMPlaylist = nullptr;
static std::atomic<bool> quit(false);
static std::atomic<bool> running(false);
static std::mutex pmMutex, threadMutex;
static std::condition_variable threadCondition;

static void nextValidPreset() {
    while (1) {
        try {
            projectm_playlist_play_next(projectMPlaylist, true);
            break;
        }
        catch (...) {
            /* preset parse threw, can't do anything... */
        }
    }
}

static void prevValidPreset() {
    while (1) {
        try {
            projectm_playlist_play_previous(projectMPlaylist, true);
            break;
        }
        catch (...) {
            /* preset parse threw, can't do anything... */
        }
    }
}


#ifndef WIN32
    static const int MAX_SAMPLES = 1024;
    static const char* PCM_PIPE = "/tmp/musikcube_pcm.pipe";
    static std::condition_variable pipeReadCondition;
    static std::atomic<bool> pipeOpen(false);

    void pipeReadProc() {
        bool pipeOpen = true;
        float samples[MAX_SAMPLES];
        int count = 0;
        while (!quit.load()) {
            mkfifo(PCM_PIPE, 0666);
            std::cerr << "pipeReadProc: opening pipe...\n";
            int pipeFd = open(PCM_PIPE, O_RDONLY);
            std::cerr << "pipeReadProc: open returned\n";
            if (pipeFd > 0) {
                std::cerr << "pipeReadProc: pipe stream opened fd=" << pipeFd << "\n";
                while (pipeFd > 0) {
                    int count = read(pipeFd, (void *)&samples, MAX_SAMPLES * sizeof(float));
                    if (count > 0) {
                        writePcmData((float*) samples, count / sizeof(float), 2);
                    }
                    else {
                        close(pipeFd);
                        pipeFd = 0;
                    }
                }
            }
        } /* while (!quit) */
        {
            std::unique_lock<std::mutex> lock(threadMutex);
            pipeOpen = false;
            pipeReadCondition.notify_all();
        }
        std::cerr << "pipeReadProc: done\n";
    }

    void waitForPipeReadProc() {
        while (pipeOpen.load()) {
            std::unique_lock<std::mutex> lock(threadMutex);
            pipeReadCondition.wait(lock);
        }
    }
#endif

void musikcube::projectm::writePcmData(float* samples, int totalSamples, int channels) {
    std::unique_lock<std::mutex> lock(pmMutex);
    if (projectM) {
        projectm_pcm_add_float(
            projectM,
            samples,
            totalSamples / channels,
            channels == 1 ? PROJECTM_MONO : PROJECTM_STEREO);
    }
}

void musikcube::projectm::stopWindowProc() {
    quit.store(true);
    #ifndef WIN32
        waitForPipeReadProc();
    #endif
    while (running.load()) {
        std::unique_lock<std::mutex> lock(threadMutex);
        threadCondition.wait(lock);
    }
}

void musikcube::projectm::runWindowProc() {
    quit.store(false);
    running.store(true);

    #ifndef WIN32
        std::thread background(pipeReadProc);
        background.detach();
    #endif

    SDL_Event event;
    SDL_GLContext glContext = nullptr;
    SDL_Window* screen = nullptr;

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

            {
                std::unique_lock<std::mutex> lock(pmMutex);
                projectM = projectm_create();
                projectm_set_window_size(projectM, width, height);
                projectm_set_fps(projectM, MAX_FPS);
                projectm_set_mesh_size(projectM, 220, 125);
                projectm_set_aspect_correction(projectM, true);
                projectm_set_preset_duration(projectM, 30);
                projectm_set_soft_cut_duration(projectM, 3);
                projectm_set_hard_cut_enabled(projectM, false);
                projectm_set_hard_cut_duration(projectM, 20);
                projectm_set_hard_cut_sensitivity(projectM, 1.0);
                projectm_set_beat_sensitivity(projectM, 1.0);

                const std::string presetPath = util::getModuleDirectory();
                projectMPlaylist = projectm_playlist_create(projectM);
                projectm_playlist_set_shuffle(projectMPlaylist, true);
                projectm_playlist_add_path(projectMPlaylist, presetPath.c_str(), true, false);
                projectm_playlist_sort(projectMPlaylist, 0, projectm_playlist_size(projectMPlaylist), SORT_PREDICATE_FILENAME_ONLY, SORT_ORDER_ASCENDING);
            }

            recreate = false;
        }

        while (SDL_PollEvent(&event)) {
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
             //}
            if (event.type == SDL_WINDOWEVENT) {
                if (event.window.event == SDL_WINDOWEVENT_CLOSE) {
                    quit.store(true);
                    continue;
                }
                else if (event.window.event == SDL_WINDOWEVENT_RESIZED) {
                    SDL_GetWindowSize(screen, &width, &height);
                    projectm_set_window_size(projectM, width, height);
                    projectm_reset_textures(projectM);
                }
            }
            else if (event.type == SDL_KEYDOWN) {
                /* https://github.com/clangen/projectM-musikcube/blob/447b5908b5f87b52dab36124bcf4f95f6fbbb17e/src/libprojectM/KeyHandler.cpp#L113 */
                auto const key = event.key.keysym.scancode;
                if (key == SDL_SCANCODE_UP) {
                    auto const current = projectm_get_beat_sensitivity(projectM);
                    projectm_set_beat_sensitivity(projectM, current + 0.2f);
                }
                else if (key == SDL_SCANCODE_DOWN) {
                    auto const current = projectm_get_beat_sensitivity(projectM);
                    projectm_set_beat_sensitivity(projectM, current - 0.2f);
                }
                else if (key == SDL_SCANCODE_RIGHT) {
                    projectm_playlist_set_shuffle(projectMPlaylist, false);
                    nextValidPreset();
                }
                else if (key == SDL_SCANCODE_LEFT) {
                    projectm_playlist_set_shuffle(projectMPlaylist, false);
                    prevValidPreset();
                }
                else if (key == SDL_SCANCODE_SPACE) {
                    projectm_playlist_set_shuffle(projectMPlaylist, true);
                    nextValidPreset();
                }
                else if (key == SDL_SCANCODE_ESCAPE) {
                    quit.store(true);
                    continue;
                }
            }
        }

        try {
            std::unique_lock<std::mutex> lock(pmMutex);
            projectm_opengl_render_frame(projectM);
        }
        catch (...) {
            /* if the selected preset throws an exception, cut over to the next
            one immediately. */
            nextValidPreset();
        }

        SDL_GL_SwapWindow(screen);

        auto end = system_clock::now();
        auto delta = duration_cast<milliseconds>(end - start);
        long long waitTime = MILLIS_PER_FRAME - (delta.count());
        if (waitTime > 0) {
            util::sleep(waitTime);
        }
    }

    #ifndef WIN32
        quit = true;
        waitForPipeReadProc();
    #endif

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
    running.store(false);

    {
        std::unique_lock<std::mutex> lock(threadMutex);
        threadCondition.notify_all();
    }
}

#ifndef WIN32
    int main(int argc, char *argv[]) {
        musikcube::projectm::runWindowProc();
        return 0;
    }
#endif

