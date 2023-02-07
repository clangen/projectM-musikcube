#pragma once

#include <string>

#ifdef WIN32
    #define DLL_EXPORT __declspec(dllexport)
#else
    #define DLL_EXPORT
#endif

namespace util {
    std::string getModuleDirectory(void* module = nullptr);
    void sleep(long long millis);
}