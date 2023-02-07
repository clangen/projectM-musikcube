#!/bin/sh

OUT="../musikcube/bin/plugins"
PLATFORM=$(uname)

mkdir -p $OUT 2> /dev/null
mkdir -p "$OUT/projectM" 2> /dev/null
mkdir -p "$OUT/projectM/fonts" 2> /dev/null
mkdir -p "$OUT/projectM/presets" 2> /dev/null
mkdir -p "$OUT/projectM/textures" 2> /dev/null

if [ "$PLATFORM" = 'Linux' ]; then
    echo "[post-build] rpath patching Linux files..."
    patchelf --set-rpath "\$ORIGIN" src/libprojectM-out/lib/libprojectM_playlist.so
    patchelf --set-rpath "\$ORIGIN" src/libprojectM-out/lib/libprojectM.so
    patchelf --set-rpath "\$ORIGIN" src/libprojectM_musikcube_plugin.so
    patchelf --set-rpath "\$ORIGIN" src/projectM_musikcube_exe

    echo "[post-build] copying files..."
    cp src/libprojectM_musikcube_plugin.so $OUT
    cp src/libprojectM-out/lib/libprojectM.so $OUT/libprojectM.so.4
    cp src/libprojectM-out/lib/libprojectM_playlist.so $OUT/libprojectM_playlist.so.4
    cp src/projectM_musikcube_exe $OUT
fi

if [ "$PLATFORM" = 'Darwin' ]; then
    # echo "[patch-rpath] patching macOS binaries..."
    # install_name_tool -add_rpath "@executable_path/" bin/musikcube
    # install_name_tool -add_rpath "@executable_path/lib" bin/musikcube
    # install_name_tool -add_rpath "@executable_path/" bin/musikcubed
    # install_name_tool -add_rpath "@executable_path/lib" bin/musikcubed

    echo "[post-build] copying files..."
    cp src/libprojectM_musikcube_plugin.dylib $OUT
    cp src/libprojectM-out/lib/libprojectM.dylib $OUT
    cp src/libprojectM-out/lib/libprojectM_playlist.dylib $OUT
    cp src/projectM_musikcube_exe $OUT
fi


for f in "presets_milkdrop/"*.milk
do
    cp "$f" "$OUT/projectM/presets"
done