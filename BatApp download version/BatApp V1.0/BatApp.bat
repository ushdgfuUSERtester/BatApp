@echo off
setlocal enabledelayedexpansion
TITLE BatApp
color 0a
mode con cols=80 lines=25
chcp 65001 >nul

set "BASEDIR=%~dp0"
set "HELPERDIR=%BASEDIR%_Config\LogInSignUpHelper"
set "USERDIR=%BASEDIR%_Config\Users"

if not exist "%USERDIR%" mkdir "%USERDIR%"

:menu
Call :batapp
echo ^> Sing Up ^[1]
echo ^> Log In  ^[2]
echo.
echo ^> Choose an option
set /p choice= ^> 

if "%choice%"=="1" goto signup
if "%choice%"=="2" goto login
goto menu

:signup
cls
CALL :welcome
echo ^> Enter username
set /p username=^> 
echo ^> Enter password
set /p password=^> 

call "%HELPERDIR%\CreateUsername.bat" "%username%" "%USERDIR%"
set "usernum=%ERRORLEVEL%"

call "%HELPERDIR%\CreatePassword.bat" "%password%" "%usernum%" "%USERDIR%"

echo ^> Sign up successful!
timeout /t 5 >nul
goto menu

:login
cls
CALL :welcomeback
echo ^> Enter your username
set /p inputUser=^> 
echo ^> Enter your password
set /p inputPass=^> 

call "%HELPERDIR%\VerifyCredentials.bat" "%inputUser%" "%inputPass%" "%USERDIR%"
if %ERRORLEVEL%==1 (
    echo ^> Login successful!
    timeout /t 5 >nul
    goto home
) else (
    echo ^> Login failed. Try again.
    timeout /t 5 >nul
    goto menu
)

:home
cls
Call :Welcome
echo ^> Welcome to the Home screen!
echo ^> Please wait...
timeout /t 5 >nul
goto HomeScreen

:HomeScreen
cls
Call :batapp
echo ^> Go GitHub 	^[1]
echo ^> Download 	^[2]
echo ^> Settings 	^[3]
echo.
echo ^> Leave and save 	^[0]
echo.
echo ^> Choose one
set /p Home=^> 

if /i "%Home%"=="0" goto exit        
if /i "%Home%"=="1" goto GitHub  
if /i "%Home%"=="2" goto downloadpage
if /i "%Home%"=="3" goto settings    

:exit
cls
CALL :GOODBYE
timeout /t 5 >nul
exit

:GitHub
cls
CALL :GitHUBW
echo ^> GitHub is Loading
echo ^> Please wait...
timeout /t 5 >nul
start https://github.com/BatAppV/BatApp/tree/main
goto HomeScreen

:downloadpage
cls
CALL :downLOAD
echo ^> Programmer 	^[1]
echo ^> Browsers 	^[2]
echo ^> Music 	^[3]
echo ^> Games 	^[4]
echo ^> Streaming 	^[5]
echo.
echo ^> Go back 	^[0]
echo.
echo ^> Choose one
set /p GamesDOWN=^> 

if /i "%GamesDOWN%"=="0" goto HomeScreen
if /i "%GamesDOWN%"=="1" goto Programmer
if /i "%GamesDOWN%"=="2" goto Browsers
if /i "%GamesDOWN%"=="3" goto Music
if /i "%GamesDOWN%"=="4" goto Games
if /i "%GamesDOWN%"=="5" goto Streaming

:Programmer
cls
CALL :ProgrammeR
echo ^> DOWNLOAD
echo.
echo ^> Notepad++ V8.8.2 	^[1]
echo ^> Sublime Text 		^[2]
echo ^> VSCode 		^[3]
echo ^> Emacs 		^[4]
echo ^> Vim 			^[5]
echo.
echo ^> Go back ^[0]
echo.
echo ^> Choose one
set /p ProGraMeR=^> 

if /i "%ProGraMeR%"=="0" goto downloadpage
if /i "%ProGraMeR%"=="1" goto Notepad
if /i "%ProGraMeR%"=="2" goto Sublime
if /i "%ProGraMeR%"=="3" goto VSCode
if /i "%ProGraMeR%"=="4" goto Emacs
if /i "%ProGraMeR%"=="5" goto Vim

:Notepad
cls
CALL :ProgrammeR
start %BASEDIR%_Config\Batch\SetupConsole.bat 6
echo.
echo ^> Notepad++ is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Sublime
cls
CALL :ProgrammeR
start %BASEDIR%_Config\Batch\SetupConsole.bat 7
echo.
echo ^> Sublime Text is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:VSCode
cls
CALL :ProgrammeR
start %BASEDIR%_Config\Batch\SetupConsole.bat 9
echo.
echo ^> VSCode is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Emacs
cls
CALL :ProgrammeR
start %BASEDIR%_Config\Batch\SetupConsole.bat 8
echo.
echo ^> Emacs is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Vim
cls
CALL :ProgrammeR
start %BASEDIR%_Config\Batch\SetupConsole.bat 10
echo.
echo ^> Vim is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Browsers
cls
CALL :BroWseRs
echo ^> DOWNLOAD
echo.
echo ^> Opera 	^[1]
echo ^> Opera GX 	^[2]
echo ^> Chrome 	^[3]
echo ^> FireFox 	^[4]
echo ^> Brave 	^[5]
echo.
echo ^> Go back ^[0]
echo.
echo ^> Choose one
set /p DbrowSerS=^> 

if /i "%DbrowSerS%"=="0" goto downloadpage
if /i "%DbrowSerS%"=="1" goto Opera
if /i "%DbrowSerS%"=="2" goto OperaGX
if /i "%DbrowSerS%"=="3" goto Chrome
if /i "%DbrowSerS%"=="4" goto FireFox
if /i "%DbrowSerS%"=="5" goto Brave

:Opera
cls
CALL :BroWseRs
start %BASEDIR%_Config\Batch\SetupConsole.bat 12
echo.
echo ^> Opera is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:OperaGX
cls
CALL :BroWseRs
start %BASEDIR%_Config\Batch\SetupConsole.bat 13
echo.
echo ^> OperaGX is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Chrome
cls
CALL :BroWseRs
start %BASEDIR%_Config\Batch\SetupConsole.bat 11
echo.
echo ^> Chrome is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:FireFox
cls
CALL :BroWseRs
start %BASEDIR%_Config\Batch\SetupConsole.bat 14
echo.
echo ^> FireFox is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Brave
cls
CALL :BroWseRs
start %BASEDIR%_Config\Batch\SetupConsole.bat 15
echo.
echo ^> Brave is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Music
cls
CALL :MUsIC
echo ^> DOWNLOAD
echo.
echo ^> Spotify 	^[1]
echo ^> Apple Music 	^[2]
echo ^> Deezer 	^[3]
echo ^> foobar2000 	^[4]
echo ^> AIMP 		^[5]
echo.
echo ^> Go back ^[0]
echo.
echo ^> Choose one
set /p Musica=^> 

if /i "%Musica%"=="0" goto downloadpage
if /i "%Musica%"=="1" goto Spotify
if /i "%Musica%"=="2" goto Apple
if /i "%Musica%"=="3" goto Deezer
if /i "%Musica%"=="4" goto foobar2000
if /i "%Musica%"=="5" goto AIMP

:Spotify
cls
CALL :MUsIC
start %BASEDIR%_Config\Batch\SetupConsole.bat 1
echo.
echo ^> Spotify is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Apple
cls
CALL :MUsIC
start %BASEDIR%_Config\Batch\SetupConsole.bat 2
echo.
echo ^> Apple Music is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Deezer
cls
CALL :MUsIC
start %BASEDIR%_Config\Batch\SetupConsole.bat 3
echo.
echo ^> Deezer is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:foobar2000
cls
CALL :MUsIC
start %BASEDIR%_Config\Batch\SetupConsole.bat 5
echo.
echo ^> foobar2000 is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:AIMP
cls
CALL :MUsIC
start %BASEDIR%_Config\Batch\SetupConsole.bat 4
echo.
echo ^> AIMP is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Games
cls
CALL :gaMeS
echo ^> DOWNLOAD
echo.
echo ^> Steam 	^[1]
echo ^> Epic Games 	^[2]
echo.
echo ^> Go back ^[0]
echo.
echo ^> Choose one
set /p gms=^> 

if /i "%gms%"=="0" goto downloadpage
if /i "%gms%"=="1" goto SteaM
if /i "%gms%"=="2" goto EpicgameS

:SteaM
cls
CALL :gaMeS
start %BASEDIR%_Config\Batch\SetupConsole.bat 16
echo.
echo ^> Steam is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:EpicgameS
cls
CALL :gaMeS
start %BASEDIR%_Config\Batch\SetupConsole.bat 17
echo.
echo ^> Epic Games is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Streaming
cls
CALL :StreAminGG
echo ^> DOWNLOAD
echo.
echo ^> OBS 		^[1]
echo ^> Stream Labs 	^[2]
echo.
echo ^> Go back ^[0]
echo.
echo ^> Choose one
set /p strmld=^>

if /i "%strmld%"=="0" goto downloadpage
if /i "%strmld%"=="1" goto oBsDown
if /i "%strmld%"=="2" goto Streamlabss

:oBsDown
cls
CALL :StreAminGG
start %BASEDIR%_Config\Batch\SetupConsole.bat 18
echo.
echo ^> OBS is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:Streamlabss
cls
CALL :StreAminGG
start %BASEDIR%_Config\Batch\SetupConsole.bat 19
echo.
echo ^> Stream Labs Desktop is downloading...
timeout /t 5 >nul
pause
goto downloadpage

:settings
cls
CALL :SETTings
echo ^> AppVersion 1.0 [1]
echo ^> Color 	 [2]
echo ^> Full Screen 	 [3]
echo ^> Go back 	 [0]
echo ^> WARNING DELETE BatApp [4522]
echo.
echo ^> Choose one
set /p settings=^> 

if /i "%settings%"=="1" goto GitHub
if /i "%settings%"=="2" goto colOr
if /i "%settings%"=="3" goto FullbatApp
if /i "%settings%"=="0" goto HomeScreen
if /i "%settings%"=="4522" goto DeleteBatAppWarning

:DeleteBatAppWarning
set "BASEDIR=%~dp0"

set "UNINSTALL_PATH=%BASEDIR%_Config\Batch\Uninstall.bat"

if exist "%UNINSTALL_PATH%" (
    echo START uninstal...
    start "" /max "%UNINSTALL_PATH%"
) else (
    echo ERROR 2
    echo %UNINSTALL_PATH%
    pause
)
exit 

:FullbatApp
start BatAppFullScreen.bat
exit

:colOr
CALL :Color
echo.
echo ^>Black  White 	^[1]
echo ^>Black  Green 	^[2]
echo ^>Black  Red 	^[3]
echo ^>Black  Yellow 	^[4]
echo ^>Black  Purple 	^[5]
echo.^>White  Black 	^[6]
echo ^>White  Green 	^[7]
echo ^>White  Red 	^[8]
echo ^>White  Yellow 	^[9]
echo ^>White  Purple 	^[10]
echo.
echo ^> Select One Color
set /p Color=^> 

if /i "%Color%"=="1" goto BW
if /i "%Color%"=="2" goto BG
if /i "%Color%"=="3" goto BR
if /i "%Color%"=="4" goto BY
if /i "%Color%"=="5" goto BP
if /i "%Color%"=="6" goto WB
if /i "%Color%"=="7" goto WG
if /i "%Color%"=="8" goto WR
if /i "%Color%"=="9" goto WY
if /i "%Color%"=="10" goto WP

:BW
CALL :Color
color 07
goto HomeScreen
:BG
CALL :Color
color 0a
goto HomeScreen
:BR
CALL :Color
color 0c
goto HomeScreen
:BY
CALL :Color
color 0e
goto HomeScreen
:BP
CALL :Color
color 0d
goto HomeScreen
:WB
CALL :Color
color 70
goto HomeScreen
:WG
CALL :Color
color 7a
goto HomeScreen
:WR
CALL :Color
color 7c
goto HomeScreen
:WY
CALL :Color
color 7e
goto HomeScreen
:WP
CALL :Color
color 7d
goto HomeScreen

REM         WELCOME BACK

:welcomeback
cls
echo 	██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗    ██████╗  █████╗  ██████╗██╗  ██╗
echo 	██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝
echo 	██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗      ██████╔╝███████║██║     █████╔╝ 
echo 	██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝      ██╔══██╗██╔══██║██║     ██╔═██╗ 
echo 	╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗    ██████╔╝██║  ██║╚██████╗██║  ██╗
echo 	 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
echo.
exit /b

REM         WELLOME

:welcome
cls
echo 	██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
echo 	██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
echo 	██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  
echo 	██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  
echo 	╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
echo 	 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
echo.
exit /b

REM        SMMD

:batapp
cls
echo 	██████╗  █████╗ ████████╗ █████╗ ██████╗ ██████╗ 
echo 	██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗
echo 	██████╔╝███████║   ██║   ███████║██████╔╝██████╔╝
echo 	██╔══██╗██╔══██║   ██║   ██╔══██║██╔═══╝ ██╔═══╝ 
echo 	██████╔╝██║  ██║   ██║   ██║  ██║██║     ██║     
echo 	╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝     
echo.
exit /b

REM        USER INFO

:USER
cls
echo 	██╗   ██╗███████╗███████╗██████╗     ██╗███╗   ██╗███████╗ ██████╗ 
echo 	██║   ██║██╔════╝██╔════╝██╔══██╗    ██║████╗  ██║██╔════╝██╔═══██╗
echo 	██║   ██║███████╗█████╗  ██████╔╝    ██║██╔██╗ ██║█████╗  ██║   ██║
echo 	██║   ██║╚════██║██╔══╝  ██╔══██╗    ██║██║╚██╗██║██╔══╝  ██║   ██║
echo 	╚██████╔╝███████║███████╗██║  ██║    ██║██║ ╚████║██║     ╚██████╔╝
echo 	 ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝
echo.
exit /b

REM        GOOD BYE

:GOODBYE
cls
echo 	 ██████╗  ██████╗  ██████╗ ██████╗     ██████╗ ██╗   ██╗███████╗    
echo 	██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗    ██╔══██╗╚██╗ ██╔╝██╔════╝    
echo 	██║  ███╗██║   ██║██║   ██║██║  ██║    ██████╔╝ ╚████╔╝ █████╗      
echo 	██║   ██║██║   ██║██║   ██║██║  ██║    ██╔══██╗  ╚██╔╝  ██╔══╝      
echo 	╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝    ██████╔╝   ██║   ███████╗    
echo 	 ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝     ╚═════╝    ╚═╝   ╚══════╝    
echo. 	                                                                    
echo 	                            ██╗                                     
echo 	                        ██╗██╔╝                                     
echo 	                        ╚═╝██║                                      
echo 	                        ██╗██║                                      
echo 	                        ╚═╝╚██╗                                     
echo 	                            ╚═╝                                    
echo.
exit /b 	

REM       DOWNLOAD

:downLOAD
cls
echo 	██████╗  ██████╗ ██╗    ██╗███╗   ██╗██╗      ██████╗  █████╗ ██████╗ 
echo 	██╔══██╗██╔═══██╗██║    ██║████╗  ██║██║     ██╔═══██╗██╔══██╗██╔══██╗
echo 	██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║██║     ██║   ██║███████║██║  ██║
echo 	██║  ██║██║   ██║██║███╗██║██║╚██╗██║██║     ██║   ██║██╔══██║██║  ██║
echo 	██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║███████╗╚██████╔╝██║  ██║██████╔╝
echo 	╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ 
echo.
exit /b

REM       SETTINGS

:SETTings
cls
echo 	███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
echo 	██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
echo 	███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
echo 	╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
echo 	███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
echo 	╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
echo.
exit /b

REM       Color

:Color
cls
echo 	 ██████╗ ██████╗ ██╗      ██████╗ ██████╗ 
echo 	██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗
echo 	██║     ██║   ██║██║     ██║   ██║██████╔╝
echo 	██║     ██║   ██║██║     ██║   ██║██╔══██╗
echo 	╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║
echo 	 ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝
echo.
exit /b

REM       PROGRAMMER

:ProgrammeR
cls
echo 	██████╗ ██████╗  ██████╗  ██████╗ ██████╗  █████╗ ███╗   ███╗███╗   ███╗███████╗██████╗ 
echo 	██╔══██╗██╔══██╗██╔═══██╗██╔════╝ ██╔══██╗██╔══██╗████╗ ████║████╗ ████║██╔════╝██╔══██╗
echo 	██████╔╝██████╔╝██║   ██║██║  ███╗██████╔╝███████║██╔████╔██║██╔████╔██║█████╗  ██████╔╝
echo 	██╔═══╝ ██╔══██╗██║   ██║██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  ██╔══██╗
echo 	██║     ██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗██║  ██║
echo 	╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
echo.
exit /b

REM       BROWSERS

:BroWseRs
cls
echo 	██████╗ ██████╗  ██████╗ ██╗    ██╗███████╗███████╗██████╗ ███████╗
echo 	██╔══██╗██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔════╝██╔══██╗██╔════╝
echo 	██████╔╝██████╔╝██║   ██║██║ █╗ ██║███████╗█████╗  ██████╔╝███████╗
echo 	██╔══██╗██╔══██╗██║   ██║██║███╗██║╚════██║██╔══╝  ██╔══██╗╚════██║
echo 	██████╔╝██║  ██║╚██████╔╝╚███╔███╔╝███████║███████╗██║  ██║███████║
echo 	╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝
echo.
exit /b

REM       Music

:MUsIC
cls
echo 	███╗   ███╗██╗   ██╗███████╗██╗ ██████╗
echo 	████╗ ████║██║   ██║██╔════╝██║██╔════╝
echo 	██╔████╔██║██║   ██║███████╗██║██║     
echo 	██║╚██╔╝██║██║   ██║╚════██║██║██║     
echo 	██║ ╚═╝ ██║╚██████╔╝███████║██║╚██████╗
echo 	╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝ ╚═════╝
echo.
exit /b

REM       GAMES

:gaMeS
cls
echo 	 ██████╗  █████╗ ███╗   ███╗███████╗███████╗
echo 	██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔════╝
echo 	██║  ███╗███████║██╔████╔██║█████╗  ███████╗
echo 	██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ╚════██║
echo 	╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗███████║
echo 	 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝
echo.
exit /b

REM       STREAMING

:StreAminGG
cls
echo 	███████╗████████╗██████╗ ███████╗ █████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗ 
echo 	██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔════╝ 
echo 	███████╗   ██║   ██████╔╝█████╗  ███████║██╔████╔██║██║██╔██╗ ██║██║  ███╗
echo 	╚════██║   ██║   ██╔══██╗██╔══╝  ██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║
echo 	███████║   ██║   ██║  ██║███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝
echo 	╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
echo.
exit /b

REM       GITHUB

:GitHUBW
cls
echo 	 ██████╗ ██╗████████╗██╗  ██╗██╗   ██╗██████╗ 
echo 	██╔════╝ ██║╚══██╔══╝██║  ██║██║   ██║██╔══██╗
echo 	██║  ███╗██║   ██║   ███████║██║   ██║██████╔╝
echo 	██║   ██║██║   ██║   ██╔══██║██║   ██║██╔══██╗
echo 	╚██████╔╝██║   ██║   ██║  ██║╚██████╔╝██████╔╝
echo 	 ╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
echo.
exit /b