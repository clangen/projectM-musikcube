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

#include <musikcore/sdk/constants.h>
#include <musikcore/sdk/IPcmVisualizer.h>
#include <musikcore/sdk/IPlugin.h>

#include "Utility.h"

static const char* PCM_PIPE = "/tmp/musikcube_pcm.pipe";
static const long long PID_CHECK_INTERVAL_MILLIS = 2000;

using namespace std::chrono;

static long long now() {
    return duration_cast<milliseconds>(
        system_clock::now().time_since_epoch()).count();
}

class UnixVisualizer : public musik::core::sdk::IPcmVisualizer {
    private:
        int pipeFd;
        pid_t pid;
        long long lastPidCheck;

    public:
        UnixVisualizer() {
            mkfifo(PCM_PIPE, 0666);
            pipeFd = 0;
            pid = 0;
            lastPidCheck = now();
        }

        virtual ~UnixVisualizer() {
            close(pipeFd);
            unlink(PCM_PIPE);
        }

        virtual const char* Name() override {
            return "projectM";
        }

        virtual void Release() override {
            this->Hide();
            delete this;
        }

        virtual void Write(musik::core::sdk::IBuffer* buffer) override {
            if (pid) {
                if (pipeFd <= 0) {
                    pipeFd = open(PCM_PIPE, O_WRONLY | O_NONBLOCK);
                    std::cerr << "Write: pipe open returned " << pipeFd << "\n";
                }
                if (pipeFd > 0) {
                    if (write(pipeFd, (void *) buffer->BufferPointer(), buffer->Bytes()) < 0) {
                        close(pipeFd);
                        pipeFd = 0;
                    }
                }
            }
        }

        virtual void Show() override {
            if (!Visible()) {
                pid_t pid;
                if ((pid = fork()) == 0) {
                    const std::string command =
                        util::getModuleDirectory(nullptr) +
                        "/plugins/projectM_musikcube_exe";
                    execl(command.c_str(), command.c_str(), "", NULL);
                    exit(-1);
                }
                else {
                    this->pid = pid;
                }
            }
        }

        virtual void Hide() override {
            if (Visible()) {
                if (this->pid > 0) {
                    kill((pid_t) pid, SIGKILL);
                    int status;
                    waitpid(pid, &status, 0);
                    this->pid = 0;
                }
            }
        }

        virtual bool Visible() override {
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

extern "C" musik::core::sdk::IPcmVisualizer* GetPcmVisualizer() {
    return new UnixVisualizer();
}
