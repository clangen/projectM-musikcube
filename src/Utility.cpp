#include "Utility.h"

#include <string>
#include <fstream>

#ifdef WIN32
    #include <shlwapi.h>
#else
    #ifdef __APPLE__
        #include <mach-o/dyld.h>
    #endif
    #include <sstream>
    #include <unistd.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <fstream>
    #include <signal.h>
#endif

namespace util {
    #ifdef WIN32
        std::string getModuleDirectory(void* module) {
            std::string result;
            char path[2048];
            int length = GetModuleFileName((HMODULE) module, path, 2048);
            if (length > 0 && length <= 2048) {
                if (PathRemoveFileSpec(path)) {
                    result.assign(path);
                }
            }
            return result;
        }
    #else
        std::string getModuleDirectory(void* module) {
        std::string result;
        #ifdef __APPLE__
            char pathbuf[4096 + 1];
            uint32_t bufsize = sizeof(pathbuf);
            _NSGetExecutablePath(pathbuf, &bufsize);
            result.assign(pathbuf);
            size_t last = result.find_last_of("/");
            return result.substr(0, last); /* remove filename component */
        #else
            std::stringstream ss;
            ss << "/proc/" << (int) getpid() << "/exe";
            std::string pathToProc = ss.str();
            char pathbuf[4096 + 1];
            readlink(pathToProc.c_str(), pathbuf, 4096);
            result.assign(pathbuf);
            size_t last = result.find_last_of("/");
            return result.substr(0, last); /* remove filename component */
        #endif
        }
    #endif

    #ifdef WIN32
        void sleep(long long millis) {
            Sleep((DWORD) millis);
        }
    #else
        void sleep(long long millis) {
            usleep(millis * 1000);
        }
    #endif
}
