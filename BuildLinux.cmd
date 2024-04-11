@echo off
setlocal
cd /d "%~dp0"

wsl -l
if errorlevel 1 (
    echo Please install WSL distribution first.
    pause
    exit /b
)

wsl -- ^
export PATH=$PWD/Tools/cmake/bin:$PWD/Tools/ninja:$PATH ^&^& ^
cmake -B "Build/Linux" -G "Ninja Multi-Config" -DCMAKE_SYSTEM_NAME=Linux %* ^&^& ^
cmake --build Build/Linux --config Debug ^&^&^
cmake --build Build/Linux --config Release ||^
pause

endlocal
