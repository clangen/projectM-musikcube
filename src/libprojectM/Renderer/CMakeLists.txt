project(Renderer)

SET(SOIL_SOURCES
	SOIL/image_DXT.c
	SOIL/image_helper.c
	SOIL/SOIL.c
	SOIL/stb_image_aug.c
)

SET(Renderer_SOURCES
	FBO.cpp
	MilkdropWaveform.cpp
	PerPixelMesh.cpp
	Pipeline.cpp
	Renderer.cpp
	ShaderEngine.cpp
	UserTexture.cpp
	Waveform.cpp
	Filters.cpp
	PerlinNoise.cpp
	PipelineContext.cpp
	Renderable.cpp
	BeatDetect.cpp
	Shader.cpp
	TextureManager.cpp
	VideoEcho.cpp
	RenderItemDistanceMetric.cpp
	RenderItemMatcher.cpp
	${SOIL_SOURCES}
)

SET (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
SET (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
SET (MATH_LIBRARIES m)

ADD_DEFINITIONS(-DUSE_FTGL)

INCLUDE_DIRECTORIES(
	"/usr/local/include"
	"/usr/include/freetype2"
	"/usr/local/include/freetype2"
	${projectM_SOURCE_DIR})

ADD_LIBRARY(Renderer STATIC 
	${Renderer_SOURCES})

TARGET_LINK_LIBRARIES(Renderer
	${MATH_LIBRARIES}
	${GLEW_LINK_TARGETS}
	${FTGL_LINK_TARGETS}
	${OPENGL_LIBRARIES}
	${IMAGE_LINK_TARGETS}
	${CG_LINK_TARGETS}
	${FREETYPE2_LIBRARIES}
)

set_target_properties(Renderer PROPERTIES COMPILE_FLAGS "-Wno-parentheses")
