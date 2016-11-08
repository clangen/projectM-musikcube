PROJECT(projectM)

cmake_minimum_required(VERSION 3.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

OPTION (USE_FBO "Use Framebuffer Objects for increased rendering quality.  Disable this for OpenGL ES 1.x or if you are experiencing problems on older or poorly supported hardware." ON)
OPTION (USE_GLES1 "Use OpenGL ES 1.x" OFF)
OPTION (USE_CG "Use Cg for Pixel Shader support" OFF)
OPTION (BUILD_PROJECTM_STATIC "Build the projectM target library in the platform's native static (NOT shared) format." ON)

set(PROJECTM_VERSION 2.1.0)
set(PROJECTM_ABI_LEVEL 2)

ADD_DEFINITIONS(-DCMAKE_INSTALL_PREFIX="\\\"${CMAKE_INSTALL_PREFIX}\\\"")

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
	PresetFactoryManager.cpp
	Renderer/FBO.cpp
	Renderer/MilkdropWaveform.cpp
	Renderer/PerPixelMesh.cpp
	Renderer/Pipeline.cpp
	Renderer/Renderer.cpp
	Renderer/ShaderEngine.cpp
	Renderer/UserTexture.cpp
	Renderer/Waveform.cpp
	Renderer/Filters.cpp
	Renderer/PerlinNoise.cpp
	Renderer/PipelineContext.cpp
	Renderer/Renderable.cpp
	Renderer/BeatDetect.cpp
	Renderer/Shader.cpp
	Renderer/TextureManager.cpp
	Renderer/VideoEcho.cpp
	Renderer/RenderItemDistanceMetric.cpp
	Renderer/RenderItemMatcher.cpp
	Renderer/SOIL/image_DXT.c
	Renderer/SOIL/image_helper.c
	Renderer/SOIL/SOIL.c
	Renderer/SOIL/stb_image_aug.c
	MilkdropPresetFactory/BuiltinFuncs.cpp
	MilkdropPresetFactory/Func.cpp 
	MilkdropPresetFactory/MilkdropPreset.cpp
	MilkdropPresetFactory/Param.hpp 
	MilkdropPresetFactory/PresetFrameIO.cpp
	MilkdropPresetFactory/CustomShape.cpp
	MilkdropPresetFactory/Eval.cpp
	MilkdropPresetFactory/MilkdropPresetFactory.cpp
	MilkdropPresetFactory/PerPixelEqn.cpp 
	MilkdropPresetFactory/BuiltinParams.cpp
	MilkdropPresetFactory/InitCond.cpp 
	MilkdropPresetFactory/Parser.cpp
	MilkdropPresetFactory/CustomWave.cpp 
	MilkdropPresetFactory/Expr.cpp
	MilkdropPresetFactory/PerPointEqn.cpp 
	MilkdropPresetFactory/Param.cpp
	MilkdropPresetFactory/PerFrameEqn.cpp
	MilkdropPresetFactory/IdlePreset.cpp
	#NativePresetFactory/NativePresetFactory.cpp
)

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

INCLUDE_DIRECTORIES(
	"/usr/local/include"
	"/usr/include/freetype2"
	"/usr/local/include/freetype2"
	"./Renderer"
	"./Renderer/SOIL"
	"./MilkdropPresetFactory"
	"./NativePresetFactory"
	${projectM_SOURCE_DIR}
	${PRESET_FACTORY_SOURCES}
)

LINK_DIRECTORIES(
	"/usr/local/lib"
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
CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/config.inp.in" "${CMAKE_CURRENT_BINARY_DIR}/config.inp" @ONLY)