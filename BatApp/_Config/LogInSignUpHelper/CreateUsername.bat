@echo off
setlocal enabledelayedexpansion

set "username=%~1"
set "USERDIR=%~2"

:: Szóköz eltávolítás
set "username=!username: =!"

:: Megkeressük a legnagyobb felhasználószámot
set maxnum=0
for %%F in ("%USERDIR%\*username.txt") do (
    set "filename=%%~nxF"
    call :getnum "!filename!" num
    if !num! gtr !maxnum! set maxnum=!num!
)

set /a newnum=maxnum + 1

:: Fájl létrehozása
echo !username!>"%USERDIR%\!newnum!username.txt"

:: Visszatérés a felhasználószámmal
endlocal & exit /b %newnum%

:getnum
setlocal
set "name=%~1"
set "result=0"
for /f "tokens=1 delims=u" %%a in ("%name%") do set "result=%%a"
endlocal & set "%2=%result%"
goto :eof
