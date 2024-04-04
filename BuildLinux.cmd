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
cmake -B "Build/Linux" -G "Ninja Multi-Config" -DCMAKE_SYSTEM_NAME=Linux ^&^& ^
cmake --build Build/Linux --config Debug ||^
pause

endlocal
