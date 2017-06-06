#include <iostream>

#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <fstream>
#include <iostream>
#include <signal.h>
#include <chrono>

#include <core/sdk/constants.h>
#include <core/sdk/IPcmVisualizer.h>
#include <core/sdk/IPlugin.h>

#include "Utility.h"

static const char* PCM_PIPE = "/tmp/musikcube_pcm.pipe";
static const long long PID_CHECK_INTERVAL_MILLIS = 2000;

using namespace std::chrono;

static long long now() {
    return duration_cast<milliseconds>(
        system_clock::now().time_since_epoch()).count();
}

class VisualizerPlugin : public musik::core::sdk::IPlugin {
    public:
        virtual void Destroy() { delete this; }
        virtual const char* Name() { return "projectM IPcmVisualizer"; }
        virtual const char* Version() { return "0.4.7"; }
        virtual const char* Author() { return "clangen"; }
        virtual const char* Guid() { return "1e4b1884-65dd-4010-84a5-7c0f5732f343"; }
        virtual bool Configurable() { return false; }
        virtual void Configure() { }
        virtual void Reload() { }
        virtual int SdkVersion() { return musik::core::sdk::SdkVersion; }
};

class Visualizer : public musik::core::sdk::IPcmVisualizer {
    private:
        int pipeFd;
        pid_t pid;
        long long lastPidCheck;

    public:
        Visualizer() {
            mkfifo(PCM_PIPE, 0666);
            pipeFd = 0;
            pid = 0;
            lastPidCheck = now();
        }

        virtual ~Visualizer() {
            close(pipeFd);
            unlink(PCM_PIPE);
        }

        virtual const char* Name() {
            return "projectM";
        }

        virtual void Destroy() {
            this->Hide();
            delete this;
        }

        virtual void Write(musik::core::sdk::IBuffer* buffer) {
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

                    execl(command.c_str(), command.c_str(), "", NULL);
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
            long long t = now();
            if (pid != 0 && t - lastPidCheck > PID_CHECK_INTERVAL_MILLIS) {
                int status;
                if (waitpid(pid, &status, WNOHANG) != 0) {
                    pid = 0;
                }
                lastPidCheck = t;
            }

            return this->pid != 0;
        }
};

extern "C" musik::core::sdk::IPlugin* GetPlugin() {
    return new VisualizerPlugin();
}

extern "C" musik::core::sdk::IPcmVisualizer* GetPcmVisualizer() {
    return new Visualizer();
}
