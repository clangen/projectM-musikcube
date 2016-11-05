PROJECT(projectM_musikcube)

cmake_minimum_required(VERSION 3.0)

set(PROJECTM_MUSIKCUBE_VERSION 1.0.0)

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-std=c++11")

SET(projectM_musikcube_SOURCES 
	projectMPcmVisualizer.cpp)

ADD_LIBRARY(projectM_musikcube SHARED ${projectM_musikcube_SOURCES})

INCLUDE_DIRECTORIES(
    "../../../musikcube/src/core/"
    "../libprojectM"
	"/usr/local/include"
	${projectM_SOURCE_DIR}
)

LINK_DIRECTORIES(
    "../libprojectM"
	"/usr/local/lib"
)

find_package(OpenGL REQUIRED)
find_package(Freetype REQUIRED)
find_library(GLEW_LIB GLEW HINTS /usr/lib /usr/local/lib)
find_library(FTGL_LIB ftgl HINTS /usr/lib /usr/local/lib)
find_library(FREETYPE_LIB freetype HINTS /usr/lib /usr/local/lib)
find_library(SDL2_LIB SDL2 HINTS /usr/lib /usr/local/lib)
find_library(PROJECTM_MAIN_LIB projectM HINTS ../libprojectM)
find_library(PROJECTM_RENDERER_LIB Renderer HINTS ../libprojectM/Renderer)
find_library(PROJECTM_MILKDROP_LIB MilkdropPresetFactory HINTS ../libprojectM/MilkdropPresetFactory)
find_library(PROJECTM_NATIVE_LIB NativePresetFactory HINTS ../libprojectM/NativePresetFactory)

ADD_DEFINITIONS(-DUSE_FTGL)

IF(APPLE)
   FIND_LIBRARY(CORE_FOUNDATION_LIBRARY CoreFoundation)
   MARK_AS_ADVANCED (CORE_FOUNDATION_LIBRARY)
   SET(FRAMEWORK_LIBS ${CORE_FOUNDATION_LIBRARY})
ELSE (APPLE)
	SET(FRAMEWORK_LIBS "")
ENDIF (APPLE)

TARGET_LINK_LIBRARIES(projectM_musikcube
    ${PROJECTM_MAIN_LIB}
    ${PROJECTM_RENDERER_LIB}
    ${PROJECTM_MILKDROP_LIB}
    ${PROJECTM_NATIVE_LIB}
    ${SDL2_LIB}
	${OPENGL_LIBRARIES}
	${GLEW_LIB}
	${FTGL_LIB}
	${FREETYPE_LIB}
	${FRAMEWORK_LIBS}    
	m
	dl
)