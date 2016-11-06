PROJECT(projectM)

cmake_minimum_required(VERSION 3.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

OPTION (USE_FBO "Use Framebuffer Objects for increased rendering quality.  Disable this for OpenGL ES 1.x or if you are experiencing problems on older or poorly supported hardware." ON)
OPTION (USE_GLES1 "Use OpenGL ES 1.x" OFF)
OPTION (USE_CG "Use Cg for Pixel Shader support" OFF)
OPTION (BUILD_PROJECTM_STATIC "Build the projectM target library in the platform's native static (NOT shared) format." ON)
OPTION (DISABLE_NATIVE_PRESETS "Turn off support for native (C++ style) presets" ON)
OPTION (DISABLE_MILKDROP_PRESETS "Turn off support for Milkdrop (.milk / .prjm) presets"  OFF)

set(PROJECTM_VERSION 2.1.0)
set(PROJECTM_ABI_LEVEL 2)

ADD_DEFINITIONS(-DCMAKE_INSTALL_PREFIX="\\\"${CMAKE_INSTALL_PREFIX}\\\"")

SET(LIB_INSTALL_DIR "\${exec_prefix}/lib"
	CACHE PATH "The subdirectory relative to the install prefix where libraries will be installed (default is /lib)"
	FORCE)

SET(projectM_SOURCES 
	projectM.cpp 
	PCM.cpp 
	Preset.cpp 
	fftsg.cpp 
	KeyHandler.cpp
	timer.cpp 
	wipemalloc.cpp 
	PresetLoader.cpp  
	PresetChooser.cpp 
	PipelineMerger.cpp 
	ConfigFile.cpp  
	TimeKeeper.cpp
	PresetFactory.cpp 
	PresetFactoryManager.cpp)

if (NOT DISABLE_NATIVE_PRESETS)
	add_subdirectory(NativePresetFactory)
	SET(PRESET_FACTORY_SOURCES ${PRESET_FACTORY_SOURCES} ${NativePresetFactory_SOURCE_DIR})
	SET(PRESET_FACTORY_BINARY_DIR ${PRESET_FACTORY_BINARY_DIR} ${NativePresetFactory_BINARY_DIR})
	SET(PRESET_FACTORY_LINK_TARGETS ${PRESET_FACTORY_LINK_TARGETS} NativePresetFactory)
endif(NOT DISABLE_NATIVE_PRESETS)

if (NOT DISABLE_MILKDROP_PRESETS)
	add_subdirectory(MilkdropPresetFactory)
	SET(PRESET_FACTORY_SOURCES ${PRESET_FACTORY_SOURCES} ${MilkdropPresetFactory_SOURCE_DIR})
	SET(PRESET_FACTORY_BINARY_DIR ${PRESET_FACTORY_BINARY_DIR} ${MilkdropPrmaesetFactory_BINARY_DIR})
	SET(PRESET_FACTORY_LINK_TARGETS ${PRESET_FACTORY_LINK_TARGETS} MilkdropPresetFactory)
endif(NOT DISABLE_MILKDROP_PRESETS)

SET (projectM_SOURCES ${projectM_SOURCES})

if (USE_CG)
	ADD_DEFINITIONS(-DUSE_CG)
	SET (CG_LINK_TARGETS Cg CgGL)
else (USE_CG)
	SET (CG_LINK_TARGETS)
endif(USE_CG)

include(CheckCXXCompilerFlag)

if(USE_GLES1)
	ADD_DEFINITIONS(-DUSE_GLES1)
endif(USE_GLES1)

if(USE_FBO)
	ADD_DEFINITIONS(-DUSE_FBO)
endif(USE_FBO)

#if (BUILD_PROJECTM_STATIC)
	ADD_LIBRARY(projectM STATIC ${projectM_SOURCES})
#else(BUILD_PROJECTM_STATIC)
#	ADD_LIBRARY(projectM SHARED ${projectM_SOURCES})
#endif(BUILD_PROJECTM_STATIC)

set_property(TARGET projectM PROPERTY INTERFACE_LINK_LIBRARIES "")
set_property(TARGET projectM PROPERTY IMPORTED_LINK_DEPENDENT_LIBRARIES "")
SET_TARGET_PROPERTIES(projectM PROPERTIES VERSION ${PROJECTM_VERSION} SOVERSION ${PROJECTM_ABI_LEVEL})

if (APPLE)
	ADD_DEFINITIONS(-DMACOS -DSTBI_NO_DDS)
	set(RESOURCE_PREFIX "Resources")
else (APPLE)
	if (WIN32)
		set (RESOURCE_PREFIX "Resources")
		ADD_DEFINITIONS(-DWIN32 -DSTBI_NO_DDS)
	else(WIN32)
		set (RESOURCE_PREFIX "share/projectM")
		ADD_DEFINITIONS(-DLINUX -DSTBI_NO_DDS)
	endif(WIN32)
endif(APPLE)

add_subdirectory(Renderer)

INCLUDE_DIRECTORIES(
	"/usr/local/include"
	"/usr/include/freetype2"
	"/usr/local/include/freetype2"
	${projectM_SOURCE_DIR}
	${Renderer_SOURCE_DIR}
	${PRESET_FACTORY_SOURCES}
)

LINK_DIRECTORIES(
	"/usr/local/lib"
	${Renderer_BINARY_DIR}
	${PRESET_FACTORY_BINARY_DIR}
)

find_package(OpenGL REQUIRED)
find_package(Freetype REQUIRED)
find_library(GLEW_LIB GLEW HINTS /usr/lib /usr/local/lib)
find_library(FTGL_LIB ftgl HINTS /usr/lib /usr/local/lib)
find_library(FREETYPE_LIB freetype HINTS /usr/lib /usr/local/lib)

add_definitions(-DUSE_FTGL)
add_definitions(-DDISABLE_NATIVE_PRESETS)

IF(APPLE)
   FIND_LIBRARY(CORE_FOUNDATION_LIBRARY CoreFoundation)
   MARK_AS_ADVANCED (CORE_FOUNDATION_LIBRARY)
   SET(FRAMEWORK_LIBS ${CORE_FOUNDATION_LIBRARY})
ELSE (APPLE)
	SET(FRAMEWORK_LIBS "")
ENDIF (APPLE)

TARGET_LINK_LIBRARIES(projectM
	Renderer
	${CG_LINK_TARGETS}
	${PRESET_FACTORY_LINK_TARGETS}
	${OPENGL_LIBRARIES}
	${GLEW_LIB}
	${FTGL_LIB}
	${FREETYPE_LIB}
	${FRAMEWORK_LIBS}
	m
	dl
)

SET(projectM_FONT_MENU "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/VeraMono.ttf" CACHE FILEPATH "Path to the default menu TrueType font")
SET(projectM_FONT_TITLE "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/Vera.ttf" CACHE FILEPATH "Path to the default title TrueType font")
ADD_DEFINITIONS(-DprojectM_FONT_MENU="\\\"${projectM_FONT_MENU}\\\"")
ADD_DEFINITIONS(-DprojectM_FONT_TITLE="\\\"${projectM_FONT_TITLE}\\\"")

CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/libprojectM.pc.in" "${CMAKE_CURRENT_BINARY_DIR}/libprojectM.pc" @ONLY)
CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/config.inp.in" "${CMAKE_CURRENT_BINARY_DIR}/config.inp" @ONLY)

IF(projectM_FONT_MENU MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/Vera.ttf" OR projectM_FONT_TITLE MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/Vera.ttf")
	INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/fonts/VeraMono.ttf DESTINATION ${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts)
ENDIF(projectM_FONT_MENU MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/Vera.ttf" OR projectM_FONT_TITLE MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/Vera.ttf")

IF(projectM_FONT_MENU MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/VeraMono.ttf" OR projectM_FONT_TITLE MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/VeraMono.ttf")
	INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/fonts/VeraMono.ttf DESTINATION ${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts)
ENDIF(projectM_FONT_MENU MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/VeraMono.ttf" OR projectM_FONT_TITLE MATCHES "${CMAKE_INSTALL_PREFIX}/${RESOURCE_PREFIX}/fonts/VeraMono.ttf")

FILE(GLOB presets "presets/*.milk" "presets/*.prjm" "presets/*.tga")
INSTALL(FILES ${presets} DESTINATION ${CMAKE_INSTALL_PREFIX}/share/projectM/presets)
INSTALL(FILES ${Renderer_SOURCE_DIR}/projectM.cg ${Renderer_SOURCE_DIR}/blur.cg DESTINATION ${CMAKE_INSTALL_PREFIX}/share/projectM/shaders)
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/config.inp DESTINATION ${CMAKE_INSTALL_PREFIX}/share/projectM)
INSTALL(FILES projectM.hpp event.h dlldefs.h fatal.h PCM.hpp Common.hpp DESTINATION include/libprojectM)
INSTALL(TARGETS projectM DESTINATION lib)
