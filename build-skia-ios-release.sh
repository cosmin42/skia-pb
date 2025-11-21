#!/usr/bin/env sh
set -euo pipefail

cd third_party/skia
python3 tools/git-sync-deps

bin/gn gen \
        ../../ios-release/skia/arm64 \
        --ide=xcode \
        --args="is_official_build=true \
            is_trivial_abi=false \
            is_debug=false \
            target_os=\"ios\" \
            target_cpu=\"arm64\" \
            skia_enable_svg=true \
            skia_use_vulkan=true \
            skia_use_system_zlib=false \
            skia_use_system_harfbuzz=false \
            skia_use_system_libjpeg_turbo=false \
            skia_use_system_libpng=false \
            skia_use_system_libwebp=false \
            skia_use_system_expat=false \
            skia_use_system_icu=false \
            extra_cflags_cc=[\"-frtti\"]"

ninja -C ../../ios-release/skia/arm64
cd ../..

mkdir -p ios-release/lib
cp ios-release/skia/arm64/*.a ios-release/lib/
cp ios-release/skia/arm64/*.dylib ios-release/lib/ || true
mkdir -p ios-release/include
cp -R third_party/skia/include ios-release/include/
cp -R third_party/skia/modules ios-release/include/
cp -R third_party/skia/src ios-release/include/
echo "Skia iOS release build completed successfully."
