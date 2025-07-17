@echo off
color 04
setlocal
goto YESORNO

:YESORNO
echo.
echo ^> UNINSTALL THE BATAPP?
echo ^> Yes or NO
echo.
set /p yesorno=^> 
if /i "%yesorno%"=="y" goto yes
if /i "%yesorno%"=="Y" goto yes
if /i "%yesorno%"=="yes" goto yes
if /i "%yesorno%"=="Yes" goto yes
if /i "%yesorno%"=="YES" goto yes

if /i "%yesorno%"=="n" goto no
if /i "%yesorno%"=="N" goto no
if /i "%yesorno%"=="no" goto no
if /i "%yesorno%"=="No" goto no
if /i "%yesorno%"=="NO" goto no

:no
cls
echo.
exit

:yes
REM Az uninstall.bat elérési útja: BatApp\_Config\Batch
REM Visszalépünk két szintet, hogy a BatApp mappához érjünk
set "BASEDIR=%~dp0..\.."

REM Absolute path normalizálása
pushd "%BASEDIR%"
set "BASEDIR=%CD%"
popd

echo ^> Uninstalling BatApp from "%BASEDIR%"...

REM Ellenőrizzük, hogy létezik-e a mappa
if exist "%BASEDIR%" (
    echo ^> Deleting BatApp directory...
    rmdir /s /q "%BASEDIR%"
    if errorlevel 1 (
        echo ^> Failed to delete BatApp folder. Please close all related programs and try again.
        pause
        exit /b 1
    ) else (
        echo ^> BatApp successfully uninstalled.
        pause
        exit /b 0
    )
) else (
    echo ^> BatApp folder not found.
    pause
    exit /b 1
)
