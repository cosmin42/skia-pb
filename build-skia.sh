#!/usr/bin/env sh
set -euo pipefail

# build-skia.sh
# Usage: ./build-skia.sh {ios|macos|windows|android}

usage() {
  echo "Usage: $0 {ios|macos|windows|android}"
  exit 2
}

if [ "$#" -ne 1 ]; then
  usage
fi

PLATFORM="$1"

case "$PLATFORM" in
  ios)
    echo "Platform: ios"
    ./build-skia-ios-release.sh
    ;;
  macos)
    echo "Platform: macos"

    ;;
  windows)
    echo "Platform: windows"

    ;;
  android)
    echo "Platform: android"

    ;;
  *)
    echo "Unknown platform: $PLATFORM"
    usage
    ;;
esac

exit 0
