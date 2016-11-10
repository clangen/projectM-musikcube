projectM-musikcube is a port of the projectM visualizer (http://projectm.sourceforge.net/) to the musikcube audio player.

the projectM sources haven't been updated since 2012 and have started to bit rot. compiling the official package has become difficult, especially on Windows using Visual Studio. additionally, many of the sample implementations are completely broken and/or are no longer relevant. 

at a high level, this repository contains the following:

1. Visual Studio 2015 build files for libprojectM 2.1.0
2. CMake build files for libprojectM 2.1.0 that work on the latest macOS and Linux (Ubuntu 16.04-16.10)
3. removal of many older libraries and plugins that are no longer building
4. a plugin for the musikcube project (Win32/macOS/Linux) implemented using SDL2
5. fixes for a handful of nasty memory leaks
6. fixes for a handful of random crashes

todo: build instructions
