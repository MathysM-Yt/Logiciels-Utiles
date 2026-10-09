@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: =============
:: Config du script
:: =============

set "Logiciel=File Pilot"

:: Vidéo Youtube
set "Presentation=https://youtu.be/7pbbWb6-J7o"

:: Site officiel / Github
set "Github=https://filepilot.tech/"

:: ============
:: Fin de la config
:: ============

:Menu
CLS

title %Logiciel% - Menu

echo Create by Mathys M - karde.me/mathysm
echo.
echo.
echo       ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
echo       ████╗ ████║██╔════╝████╗  ██║██║   ██║
echo       ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
echo       ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
echo       ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
echo       ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
echo.
echo.

echo 1. Présentation
echo 2. Site officiel / Github
echo 3. Installation automatique
echo.

CHOICE /C 123 /M "Entre ton choix:"

IF ERRORLEVEL 3 GOTO Install
IF ERRORLEVEL 2 GOTO Github
IF ERRORLEVEL 1 GOTO Presentation


:Presentation
CLS

start "" "%Presentation%"

GOTO Menu


:Github
CLS

start "" "%Github%"

GOTO Menu


:Install
CLS

title %Logiciel% - Installation automatique

echo Create by Mathys M - karde.me/mathysm
echo.
echo.
echo       ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
echo       ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
echo       ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
echo       ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
echo       ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
echo       ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
echo.
echo.

chcp 850 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; winget.exe install --id Voidstar.FilePilot --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force; $o=Join-Path ([Environment]::GetFolderPath('Desktop')) 'File Pilot.exe'; Move-Item (Join-Path $env:LOCALAPPDATA 'Microsoft\WinGet\Links\FPilot.exe') $o -Force; Start-Process $o"
chcp 65001 >nul

echo.
echo.
echo Installation terminée !
echo.
echo Retour au menu dans:
for /L %%i in (4,-1,1) do (
    echo %%i...
    timeout /t 1 /nobreak >nul
)

GOTO Menu