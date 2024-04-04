@echo off
setlocal
cd /d "%~dp0"
set path=C:\Library\Software\Develope\Build\cmake\bin;C:\Library\Software\Develope\Build\ninja;%path%

if not exist "%ProgramFiles(x86)%\Android\android-sdk" (
    echo Please install Visual Studio Mobile development with C++ workload first.
    pause
    exit /b
)

cmake -B Build\Android -G "Visual Studio 17 2022" -A ARM64 -DCMAKE_SYSTEM_NAME=Android &&^
cmake --build Build\Android --config Debug ||^
pause

endlocal
