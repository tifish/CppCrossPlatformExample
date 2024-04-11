@echo off
setlocal
cd /d "%~dp0"
set path=%~dp0Tools\cmake\bin;%~dp0Tools\ninja;%path%

if not exist "%ProgramFiles%\Microsoft Visual Studio\2022" (
    echo Please install Visual Studio 2022 first.
    pause
    exit /b
)

cmake -B Build\Windows -G "Visual Studio 17 2022" -DCMAKE_SYSTEM_NAME=Windows -DWINDOWS=TRUE %* &&^
cmake --build Build\Windows --config Debug &&^
cmake --build Build\Windows --config Release ||^
pause

endlocal
