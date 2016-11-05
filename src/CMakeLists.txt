project (projectM)

cmake_minimum_required(VERSION 3.0)

#OPTION(INCLUDE-PROJECTM-LIBVISUAL "Build the projectM libvisual client" ON)
#OPTION(INCLUDE-NATIVE-PRESETS "Build the projectM native preset sample collection " ON)

set(PROJECTM_ROOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory (libprojectM)

# if (INCLUDE-PROJECTM-LIBVISUAL)
# 	add_subdirectory (projectM-libvisual)
# endif (INCLUDE-PROJECTM-LIBVISUAL)

#if (INCLUDE-NATIVE-PRESETS)
#	add_subdirectory(NativePresets)
#endif (INCLUDE-NATIVE-PRESETS)
