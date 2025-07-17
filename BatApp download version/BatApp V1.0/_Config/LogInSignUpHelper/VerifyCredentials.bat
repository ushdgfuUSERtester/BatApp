@echo off
setlocal enabledelayedexpansion

set "inputUser=%~1"
set "inputPass=%~2"
set "USERDIR=%~3"
set "success=0"

for %%F in ("%USERDIR%\*username.txt") do (
    set "filename=%%~nxF"
    set "userfile=%%~fF"
    set "storedname="
    for /f "delims=" %%a in (!userfile!) do (
        set "storedname=%%a"
    )
    if /i "!storedname!"=="%inputUser%" (
        set "usernum=!filename:username.txt=!"
        set "storedpass="
        for /f "delims=" %%p in (%USERDIR%\!usernum!password.txt) do (
            set "storedpass=%%p"
        )
        if "!storedpass!"=="%inputPass%" (
            set success=1
            goto done
        )
    )
)

:done
endlocal & exit /b %success%
