@echo off
setlocal
cd /d "%~dp0"
set path=%~dp0Tools\cmake\bin;%~dp0Tools\ninja;%path%

if not exist "%ProgramFiles(x86)%\Android\android-sdk" (
    echo Please install Visual Studio Mobile development with C++ workload first.
    pause
    exit /b
)

cmake -B Build\Android.x64 -G "Visual Studio 17 2022" -A x64 -DCMAKE_SYSTEM_NAME=Android %* &&^
cmake --build Build\Android.x64 --config Debug &&^
cmake --build Build\Android.x64 --config Release ||^
pause

endlocal
