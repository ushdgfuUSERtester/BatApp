@echo off
setlocal

set "password=%~1"
set "usernum=%~2"
set "USERDIR=%~3"
set "BASEDIR=%~dp0..\Users"

:: Szóközök eltávolítása
set "password=%password: =%"

:: Jelszó fájl létrehozása
echo %password%>"%USERDIR%\%usernum%password.txt"

:: ➕ current.txt frissítése
echo %usernum% > "%BASEDIR%\current.txt"

exit /b
