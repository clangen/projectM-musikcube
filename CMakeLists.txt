PROJECT(projectM)
cmake_minimum_required(VERSION 3.0)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -Wno-unused-result -Wno-deprecated-declarations")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -std=c++17 -DDEBUG -g -frtti -fexceptions -fsanitize=address,undefined")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -DDEBUG")

set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -std=c++17 -O2 -frtti -fexceptions -Wno-psabi")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -Wno-psabi")

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
    FILES src/projectM-musikcube/projectM_musikcube
    PERMISSIONS OWNER_EXECUTE GROUP_EXECUTE WORLD_EXECUTE
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