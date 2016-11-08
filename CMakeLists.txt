PROJECT(projectM)
cmake_minimum_required(VERSION 3.0)

add_subdirectory(src)

file(GLOB fonts "fonts/*.ttf")
file(GLOB presets "presets/*.milk" "presets/*.prjm" "presets/*.tga")

install(
    FILES ${fonts}
    DESTINATION share/musikcube/plugins/projectM/fonts
)

install(
    FILES ${presets}
    DESTINATION share/musikcube/plugins/projectM/presets
)

install(
    FILES src/libprojectM/config.inp
    DESTINATION share/musikcube/plugins/projectM
)

install(
    FILES src/projectM-musikcube/projectM_musikcube
    DESTINATION share/musikcube/plugins
)

if (CMAKE_SYSTEM_NAME MATCHES "Linux")
    install(
        FILES src/projectM-musikcube/libprojectM_musikcube_plugin.so
        DESTINATION share/musikcube/plugins
    )
else (CMAKE_SYSTEM_NAME MATCHES "Linux")
    install(
        FILES src/projectM-musikcube/libprojectM_musikcube_plugin.dylib
        DESTINATION share/musikcube/plugins
    )
endif (CMAKE_SYSTEM_NAME MATCHES "Linux")