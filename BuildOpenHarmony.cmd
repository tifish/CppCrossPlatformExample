@echo off
setlocal
cd /d "%~dp0"

if "%OHNDK%"=="" (
    set OHNDK=C:\OpenHarmony\sdk\9\native
)

if not exist "%OHNDK%\build-tools\cmake\bin\cmake.exe" (
    echo Please install OpenHarmony NDK first.
    pause
    exit /b
)

set path=%OHNDK%\build-tools\cmake\bin;%~dp0Tools\ninja;%path%

cmake -B Build\OHOS -G Ninja -DOHOS_STL=c++_shared -DOHOS_ARCH=arm64-v8a -DOHOS_PLATFORM=OHOS -DCMAKE_TOOLCHAIN_FILE=%OHNDK%\build\cmake\ohos.toolchain.cmake &&^
cmake --build Build\OHOS ||^
pause

endlocal
