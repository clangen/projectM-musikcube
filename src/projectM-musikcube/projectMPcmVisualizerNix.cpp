#include <iostream>

#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <fstream>
#include <iostream>
#include <signal.h>

#include <sdk/IPcmVisualizer.h>
#include <sdk/IPlugin.h>

#include "Utility.h"

static const char* PCM_PIPE = "/tmp/musikcube_pcm.pipe";

class Plugin : public musik::core::IPlugin {
    public:
        virtual void Destroy() { delete this; };
        virtual const char* Name() { return "projectM IPcmVisualizer"; };
        virtual const char* Version() { return "0.1"; };
        virtual const char* Author() { return "clangen"; };
};

class Visualizer : public musik::core::audio::IPcmVisualizer {
    private:
        int pipeFd;
        pid_t pid;

    public:
        Visualizer() {
            mkfifo(PCM_PIPE, 0666);
            pipeFd = 0;
            pid = 0;
        }

        virtual ~Visualizer() {
            close(pipeFd);
            unlink(PCM_PIPE);
        }

        virtual void Destroy() {
            this->Hide();
            delete this;
        }

        virtual void Write(musik::core::audio::IBuffer* buffer) {
            if (pid) {
                if (pipeFd <= 0) {
                    pipeFd = open(PCM_PIPE, O_WRONLY | O_NONBLOCK);
                }

                if (pipeFd > 0) {
                    if (write(pipeFd, (void *) buffer->BufferPointer(), buffer->Bytes()) < 0) {
                        close(pipeFd);
                        pipeFd = 0;
                    }
                }
            }
        }

        virtual void Show() {
            if (!Visible()) {
                pid_t pid;
                if ((pid = fork()) == 0) {
                    const std::string command = 
                        util::getModuleDirectory(NULL) + 
                        "/plugins/projectM_musikcube";

                    execl(command.c_str(), command.c_str());
                    exit(-1);
                }
                else {
                    this->pid = pid;
                }
            }
        }

        virtual void Hide() {
            if (Visible()) {
                if (this->pid > 0) {
                    kill((pid_t) pid, SIGKILL);
                    int status;
                    waitpid(pid, &status, 0);
                    this->pid = 0;
                }
            }
        }

        virtual bool Visible() {
            return this->pid != 0;
        }
};

extern "C" musik::core::IPlugin* GetPlugin() {
    return new Plugin();
}

extern "C" musik::core::audio::IPcmVisualizer* GetPcmVisualizer() {
    return new Visualizer();
}