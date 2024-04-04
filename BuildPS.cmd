@echo off
setlocal
cd /d "%~dp0"
set path=C:\Library\Software\Develope\Build\cmake\bin;C:\Library\Software\Develope\Build\ninja;%path%

set PS5Toolchain=%SCE_ROOT_DIR%Prospero\Tools\CMake\PS5.cmake
if not exist "%PS5Toolchain%" (
    echo Please install PS5 SDK first.
    pause
    exit /b
)

cmake -B Build\PS -G "Ninja Multi-Config" -DCMAKE_TOOLCHAIN_FILE="%PS5Toolchain%" -DPROSPERO=TRUE &&^
cmake --build Build\PS --config Debug ||^
pause

endlocal
