@echo off
color 02

:: Get base directory (where this batch file is)
set "BaseDir=%~dp0"
:: Main directory two levels up
set "MainDir=%BaseDir%\..\..\"
:: Download main folder
set "DownloadDir=%MainDir%_Config\Download"

:: Subfolders
set "BrowsersDir=%DownloadDir%\_Browsers"
set "GamesDir=%DownloadDir%\_Games"
set "MusicDir=%DownloadDir%\_Music"
set "ProgrammerDir=%DownloadDir%\_Programmer"
set "StreamingDir=%DownloadDir%\_Streaming"

:: Check argument
if "%1"=="" (
    echo [ERROR] No number argument provided.
    echo Usage: SetupConsole.bat [1-19]
    timeout /t 5 >nul
    exit /b
)

set "Num=%1"

:: Validate range
if %Num% LSS 1 (
    echo [ERROR] Number must be between 1 and 19.
    timeout /t 5 >nul
    exit /b
)

if %Num% GTR 19 (
    echo [ERROR] Number must be between 1 and 19.
    timeout /t 5 >nul
    exit /b
)

:: Default: no file yet
set "BatchFile="

:: Music
if "%Num%"=="1" set "BatchFile=%MusicDir%\Spotify.bat"
if "%Num%"=="2" set "BatchFile=%MusicDir%\AppleMusic.bat"
if "%Num%"=="3" set "BatchFile=%MusicDir%\Deezer.bat"
if "%Num%"=="4" set "BatchFile=%MusicDir%\AIMP.bat"
if "%Num%"=="5" set "BatchFile=%MusicDir%\foobar2000.bat"

:: Programmer
if "%Num%"=="6" set "BatchFile=%ProgrammerDir%\notepad++npp.8.8.2.bat"
if "%Num%"=="7" set "BatchFile=%ProgrammerDir%\Sublime Text.bat"
if "%Num%"=="8" set "BatchFile=%ProgrammerDir%\Emacs.bat"
if "%Num%"=="9" set "BatchFile=%ProgrammerDir%\VSCode.bat"
if "%Num%"=="10" set "BatchFile=%ProgrammerDir%\Vim.bat"

:: Browsers
if "%Num%"=="11" set "BatchFile=%BrowsersDir%\GoogleChrome.bat"
if "%Num%"=="12" set "BatchFile=%BrowsersDir%\Opera.bat"
if "%Num%"=="13" set "BatchFile=%BrowsersDir%\OperaGX.bat"
if "%Num%"=="14" set "BatchFile=%BrowsersDir%\Firefox.bat"
if "%Num%"=="15" set "BatchFile=%BrowsersDir%\Brave.bat"

:: Games
if "%Num%"=="16" set "BatchFile=%GamesDir%\Steam.bat"
if "%Num%"=="17" set "BatchFile=%GamesDir%\EpicGames.bat"

:: Streaming
if "%Num%"=="18" set "BatchFile=%StreamingDir%\OBS.bat"
if "%Num%"=="19" set "BatchFile=%StreamingDir%\StreamLabsDesktop.bat"

:: Check if batch file exists and run
if exist "%BatchFile%" (
    echo [INFO] Starting installer: %BatchFile%
    start "" "%BatchFile%"
) else (
    echo [ERROR] Installer batch file not found for number %Num%.
    timeout /t 5 >nul
)

exit