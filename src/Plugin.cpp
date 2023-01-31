#include "Utility.h"
#include "SDLWindow.h"

#include <musikcore/sdk/constants.h>
#include <musikcore/sdk/IPlugin.h>

#ifdef WIN32
    BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved) {
        return true;
    }
#endif

class VisualizerPlugin : public musik::core::sdk::IPlugin {
    public:
        void Release() override { delete this; }
        const char* Name() override { return "projectM IPcmVisualizer"; }
        const char* Version() override { return "0.5.2"; }
        const char* Author() override { return "clangen"; }
        const char* Guid() override { return "1e4b1884-65dd-4010-84a5-7c0f5732f343"; }
        bool Configurable() override { return false; }
        void Configure() override { }
        void Reload() override { }
        int SdkVersion() override { return musik::core::sdk::SdkVersion; }
};

extern "C" DLL_EXPORT musik::core::sdk::IPlugin* GetPlugin() {
    return new VisualizerPlugin();
}

