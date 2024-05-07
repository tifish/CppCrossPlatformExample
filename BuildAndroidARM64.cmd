@echo off
setlocal
cd /d "%~dp0"
set path=%~dp0Tools\cmake\bin;%~dp0Tools\ninja;%path%

if not exist "%ProgramFiles(x86)%\Android\android-sdk" (
    echo Please install Visual Studio Mobile development with C++ workload first.
    pause
    exit /b
)

cmake -B Build\Android.ARM64 -G "Visual Studio 17 2022" -A ARM64 -DCMAKE_SYSTEM_NAME=Android %* &&^
cmake --build Build\Android.ARM64 --config Debug &&^
cmake --build Build\Android.ARM64 --config Release ||^
pause

endlocal
