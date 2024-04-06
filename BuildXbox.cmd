@echo off
setlocal
cd /d "%~dp0"
set path=C:\Library\Software\Develope\Build\cmake\bin;C:\Library\Software\Develope\Build\ninja;%path%

if not exist "%GRDKLatest%" (
    echo Please install Microsoft GDK first.
    pause
    exit /b
)

cmake -B Build\Xbox --fresh -G "Visual Studio 17 2022" -A Gaming.Xbox.Scarlett.x64 --toolchain CMake\gxdk_xs_toolchain.cmake -DXdkEditionTarget=230600 -DXBOX=TRUE %* &&^
cmake --build Build\Xbox --config Debug ||^
pause

endlocal
