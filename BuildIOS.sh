#!/bin/sh

cmake -B "Build/iOS" -G Xcode -DCMAKE_SYSTEM_NAME=iOS "$@" &&
    cmake --build Build/iOS --config Debug &&
    cmake --build Build/iOS --config Release
