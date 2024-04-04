@echo off
setlocal
cd /d "%~dp0"
set path=C:\Library\Software\Develope\Build\cmake\bin;C:\Library\Software\Develope\Build\ninja;%path%


if not exist "%ProgramFiles%\Microsoft Visual Studio\2022" (
    echo Please install Visual Studio 2022 first.
    pause
    exit /b
)

cmake -B Build\Windows -G "Visual Studio 17 2022" -DCMAKE_SYSTEM_NAME=Windows -DWINDOWS=TRUE &&^
cmake --build Build\Windows --config Debug ||^
pause

endlocal
