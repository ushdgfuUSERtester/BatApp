@echo off
title Python Installer Check
color 0c

echo ^> Checking for Python...

where python >nul 2>nul
if %errorlevel% == 0 (
    echo ^> Python is already installed!
    python --version
    echo.
    timeout /t 5 >nul
    exit /b
)

echo ^> Python not found. Starting download...

set "PYTHON_URL=https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe"
set "INSTALLER=python-installer.exe"

echo Downloading: %PYTHON_URL%
powershell -Command "Invoke-WebRequest -Uri '%PYTHON_URL%' -OutFile '%INSTALLER%'"

if not exist "%INSTALLER%" (
    echo Error: Download failed!
    pause
    exit /b
)

echo Download completed. Installing...
start /wait "" "%INSTALLER%" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

echo Python installation finished.
del "%INSTALLER%"

where python >nul 2>nul
if %errorlevel% == 0 (
    echo Python successfully installed!
    python --version
) else (
    echo Installation failed!
)

echo.
pause
exit /b
