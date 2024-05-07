#!/bin/sh

export PATH=$PWD/Tools/cmake/bin:$PWD/Tools/ninja:$PATH &&
    cmake -B "Build/Linux" -G "Ninja Multi-Config" -DCMAKE_SYSTEM_NAME=Linux "$@" &&
    cmake --build Build/Linux --config Debug &&
    cmake --build Build/Linux --config Release
