
#include <iostream>

#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>

#include "SDLWindow.h"

#include <musikcore/sdk/constants.h>
#include <musikcore/sdk/IPlugin.h>

class WindowsVisualizer : public musik::core::sdk::IPcmVisualizer {
    public:
        const char* Name() override {
            return "projectM";
        }

        void Release() override {
            this->Hide();
            delete this;
        }

        void Write(musik::core::sdk::IBuffer* buffer) override {
            if (Visible()) {
                std::unique_lock<std::mutex> lock(pmMutex);
                musikcube::projectm::writePcmData(
                    buffer->BufferPointer(), buffer->Samples(), buffer->Channels());
            }
        }

        void Show() override {
            if (!Visible()) {
                std::thread background(musikcube::projectm::runWindowProc);
                background.detach();
            }
        }

        void Hide() override {
            if (Visible()) {
                musikcube::projectm::stopWindowProc();
            }
        }

        bool Visible() override {
            return thread.load();
        }
};



extern "C" DLL_EXPORT musik::core::sdk::IPcmVisualizer* GetPcmVisualizer() {
    return new WindowsVisualizer();
}
