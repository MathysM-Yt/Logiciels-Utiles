@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: =============
:: Config du script
:: =============

set "Logiciel=Spicetify"

:: Vidéo Youtube
set "Presentation=https://youtu.be/lUrY0B1v59Y"

:: Site officiel / Github
set "Github=https://spicetify.app/"

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

IF ERRORLEVEL 3 GOTO Attention
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


:Attention
CLS

title %Logiciel% - Attention

echo Create by Mathys M - karde.me/mathysm
echo.
echo.
echo        █████╗ ████████╗████████╗███████╗███╗   ██╗████████╗██╗ ██████╗ ███╗   ██╗
echo       ██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝████╗  ██║╚══██╔══╝██║██╔═══██╗████╗  ██║
echo       ███████║   ██║      ██║   █████╗  ██╔██╗ ██║   ██║   ██║██║   ██║██╔██╗ ██║
echo       ██╔══██║   ██║      ██║   ██╔══╝  ██║╚██╗██║   ██║   ██║██║   ██║██║╚██╗██║
echo       ██║  ██║   ██║      ██║   ███████╗██║ ╚████║   ██║   ██║╚██████╔╝██║ ╚████║
echo       ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
echo.
echo.

start "" "windowsdefender://threatsettings"

echo Pense à désactiver temporairement ton antivirus avant de continuer
echo.
echo L'antivirus est-il désactivé ?
echo.

CHOICE /C YN /N /M "[Y]es / [N]o : "

IF ERRORLEVEL 2 GOTO Menu
IF ERRORLEVEL 1 GOTO Install

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
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.ps1 | iex"
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