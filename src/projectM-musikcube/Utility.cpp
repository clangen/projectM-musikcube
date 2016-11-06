#include "Utility.h"

#include <string>
#include <fstream>

#ifdef WIN32
    #include <shlwapi.h>
#else
    #ifdef __APPLE_
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
            char pathbuf[PATH_MAX + 1];
            uint32_t bufsize = sizeof(pathbuf);
            _NSGetExecutablePath(pathbuf, &bufsize);
            char *resolved = realpath(pathbuf, NULL);
            result.assign(resolved);
            free(resolved);
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

    #ifndef WIN32
        static const std::string PID_FILENAME = "/tmp/projectM_musikcube.pid";

        void writeExePidFile() {
            std::ofstream out(PID_FILENAME);
            out << (int) getpid();
            out.close();
        }

        int readExePidFile() {
            int result = 0;
            std::ifstream in(PID_FILENAME);
            if (in.is_open()) {
                in >> result;
            }
            return result;
        }

        bool isExeRunning() {
            int pid = readExePidFile();
            if (pid != 0) {
                return kill((pid_t) pid, 0) == 0;
            }
            return false;
        }
    #endif
}
