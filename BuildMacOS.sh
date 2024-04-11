#!/bin/sh

cmake -B "Build/Darwin" -G Xcode -DCMAKE_SYSTEM_NAME=Darwin -DDARWIN=TRUE $* &&
    cmake --build Build/Darwin --config Debug &&
    cmake --build Build/Darwin --config Release
