project (projectM)

cmake_minimum_required(VERSION 3.0)

#OPTION(INCLUDE-NATIVE-PRESETS "Build the projectM native preset sample collection " ON)

set(PROJECTM_ROOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-std=c++11")

add_subdirectory(libprojectM)
add_subdirectory(projectM-musikcube)

#if (INCLUDE-NATIVE-PRESETS)
#	add_subdirectory(NativePresets)
#endif (INCLUDE-NATIVE-PRESETS)
