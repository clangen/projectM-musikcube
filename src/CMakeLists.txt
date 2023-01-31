project(projectM_musikcube_plugin)

cmake_minimum_required(VERSION 3.11)

set(projectM_musikcube_plugin_SOURCES
	Plugin.cpp
	UnixVisualizer.cpp
	Utility.cpp)

add_library(projectM_musikcube_plugin SHARED ${projectM_musikcube_plugin_SOURCES})

set(projectM_musikcube_exe_SOURCES
	SDLWindow.cpp
	Utility.cpp)

add_executable(projectM_musikcube_exe ${projectM_musikcube_exe_SOURCES})

if (CMAKE_SYSTEM_NAME MATCHES "Darwin" OR CMAKE_SYSTEM_NAME MATCHES "FreeBSD" OR CMAKE_SYSTEM_NAME MATCHES "OpenBSD")
  set(BSD_PATH_PREFIX "/usr/local")
  if (CMAKE_SYSTEM_NAME MATCHES "Darwin")
    execute_process(
      COMMAND brew config
      COMMAND grep -i HOMEBREW_PREFIX
      COMMAND awk "{print $2}"
      OUTPUT_STRIP_TRAILING_WHITESPACE
      OUTPUT_VARIABLE BSD_PATH_PREFIX)
  endif()
endif()

include(ExternalProject)

set(LIBPROJECTM_PREFIX "${projectM_musikcube_plugin_SOURCE_DIR}/libprojectM-build/")
set(LIBPROJECTM_OUT "${projectM_musikcube_plugin_SOURCE_DIR}/libprojectM-out/")

ExternalProject_Add(libprojectM
  GIT_REPOSITORY "https://github.com/projectM-visualizer/projectm.git"
  PREFIX "${LIBPROJECTM_PREFIX}"
  BUILD_IN_SOURCE 0
  CMAKE_ARGS "-DCMAKE_INSTALL_PREFIX:PATH=${LIBPROJECTM_OUT}" "-DBUILD_SHARED_LIBS=ON"
  INSTALL_COMMAND make install)

add_dependencies(projectM_musikcube_plugin libprojectM)

include_directories(
	"${LIBPROJECTM_OUT}/include"
	"${BSD_PATH_PREFIX}/include"
	"../../musikcube/src"
	${projectM_SOURCE_DIR})

link_directories(
	"${LIBPROJECTM_OUT}/lib"
	"${BSD_PATH_PREFIX}/lib"
	"/usr/local/lib")

find_package(OpenGL REQUIRED)
find_library(GLEW_LIB GLEW)
find_library(SDL2_LIB SDL2)

IF(APPLE)
	FIND_LIBRARY(CORE_FOUNDATION_LIBRARY CoreFoundation)
	MARK_AS_ADVANCED (CORE_FOUNDATION_LIBRARY)
	SET(FRAMEWORK_LIBS ${CORE_FOUNDATION_LIBRARY})
ELSE (APPLE)
	SET(FRAMEWORK_LIBS "")
ENDIF (APPLE)

TARGET_LINK_LIBRARIES(projectM_musikcube_exe
	${OPENGL_LIBRARIES}
	${GLEW_LIB}
    ${SDL2_LIB}
	${PROJECTM_LIB}
	${PROEJCTM_PLAYLIST_LIB}
	${FRAMEWORK_LIBS}
	"${LIBPROJECTM_OUT}/lib/libprojectM.so"
	"${LIBPROJECTM_OUT}/lib/libprojectM_playlist.so"
	pthread
	m
	dl)

# add_custom_command(TARGET projectM_musikcube_plugin
# 	POST_BUILD
# 	COMMAND "${CMAKE_SOURCE_DIR}/script/post-build.sh"
# 	WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}")
