@echo off
setlocal
cd /d "%~dp0"

wsl -l
if errorlevel 1 (
    echo Please install WSL distribution first.
    pause
    exit /b
)

wsl -- ./BuildLinux.sh %* ||^
pause

endlocal
