#pragma once

#include <string>

namespace util {
    std::string getModuleDirectory(void* module = nullptr);
    void sleep(long long millis);
}