#!/bin/bash

OUT="../musikcube/bin/plugins"

mkdir -p $OUT 2> /dev/null
mkdir -p "$OUT/projectM" 2> /dev/null
mkdir -p "$OUT/projectM/fonts" 2> /dev/null
mkdir -p "$OUT/projectM/presets" 2> /dev/null
mkdir -p "$OUT/projectM/textures" 2> /dev/null

cp build/src/projectM-musikcube/libprojectM_musikcube_plugin.dylib $OUT
cp build/src/projectM-musikcube/projectM_musikcube $OUT
cp build/src/projectM-musikcube/projectM/config.inp "$OUT/projectM/"
cp fonts/* "$OUT/projectM/fonts"

for f in "presets_milkdrop/"*.milk
do
    cp "$f" "$OUT/projectM/presets"
done
