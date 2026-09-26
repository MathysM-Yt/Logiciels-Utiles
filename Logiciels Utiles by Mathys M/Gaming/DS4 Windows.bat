@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: Config du script

set "Logiciel=DS4Windows"

:: Vidéo Youtube
set "Presentation=https://youtu.be/RIQ5WF7ftAc"

:: Site officiel / Github
set "Github=https://github.com/hbashton/DS4Windows"


:: Vérifie si le script est exécuté en tant qu'administrateur
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Le script nécessite des droits administratifs.
    echo Redémarrage avec élévation de privilèges...
    powershell.exe -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:Menu
CLS

title %Logiciel% - Menu

echo Create by Mathys M - https://www.karde.me/mathysm
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
echo 3. DS4 Windows préconfiguré
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

title %Logiciel% - Attention

echo Create by Mathys M - https://www.karde.me/mathysm
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
IF ERRORLEVEL 1 GOTO Drivers


:Drivers
CLS

call :ASCIIDrivers

echo Installation des composants nécessaires à DS4Windows...
echo.

winget.exe install --id "Microsoft.DotNet.DesktopRuntime.8" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force

CLS

call :ASCIIDrivers

echo Installation des composants nécessaires à DS4Windows...
echo.

winget.exe install --id "Nefarius.HidHide" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force

CLS

call :ASCIIDrivers

echo Installation des composants nécessaires à DS4Windows...
echo.

winget.exe install --id "ViGEm.ViGEmBus" --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force

CLS

call :ASCIIDrivers

echo Les drivers nécessaires pour DS4 Windows sont installés !

echo.
choice /c:yn /n /m "As-tu une manette Dualsense/PS5? [Y]es/[N]o"

if %ERRORLEVEL% == 1 GOTO DualsenseInstall
if %ERRORLEVEL% == 2 GOTO Download


:DualsenseInstall
CLS

title %Logiciel% - PlayStation Accessories

echo Create by Mathys M - https://www.karde.me/mathysm
echo.
echo.
echo       ██████╗ ██╗   ██╗ █████╗ ██╗     ███████╗███████╗███╗   ██╗███████╗███████╗
echo       ██╔══██╗██║   ██║██╔══██╗██║     ██╔════╝██╔════╝████╗  ██║██╔════╝██╔════╝
echo       ██║  ██║██║   ██║███████║██║     ███████╗█████╗  ██╔██╗ ██║███████╗█████╗  
echo       ██║  ██║██║   ██║██╔══██║██║     ╚════██║██╔══╝  ██║╚██╗██║╚════██║██╔══╝  
echo       ██████╔╝╚██████╔╝██║  ██║███████╗███████║███████╗██║ ╚████║███████║███████╗
echo       ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝                                                                           
echo.
echo.

start "" "https://fwupdater.dl.playstation.net/fwupdater/PlayStationAccessoriesInstaller.exe"

pause
GOTO Download


:Download
CLS

title %Logiciel% - Téléchargement

echo Create by Mathys M - https://www.karde.me/mathysm
echo.
echo.
echo       ██████╗  ██████╗ ██╗    ██╗███╗   ██╗██╗      ██████╗  █████╗ ██████╗ 
echo       ██╔══██╗██╔═══██╗██║    ██║████╗  ██║██║     ██╔═══██╗██╔══██╗██╔══██╗
echo       ██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║██║     ██║   ██║███████║██║  ██║
echo       ██║  ██║██║   ██║██║███╗██║██║╚██╗██║██║     ██║   ██║██╔══██║██║  ██║
echo       ██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║███████╗╚██████╔╝██║  ██║██████╔╝
echo       ╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝                                                                    
echo.
echo.

chcp 850 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -UseBasicParsing -Uri 'https://MathysM-Yt.github.io/Logiciels-Utiles/Ressources/DS4%%20Windows%%20by%%20Mathys%%20M.7z' -OutFile ([Environment]::GetFolderPath('Desktop') + '\DS4 Windows by Mathys M.7z')"
chcp 65001 >nul


if %ERRORLEVEL% neq 0 (
    echo.
    echo ERREUR : Le téléchargement a échoué
    echo.
    pause
    GOTO Menu
)

GOTO Extract


:Extract
CLS

title %Logiciel% - Extraction

echo Create by Mathys M - https://www.karde.me/mathysm
echo.
echo.
echo       ███████╗██╗  ██╗████████╗██████╗  █████╗  ██████╗████████╗
echo       ██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝
echo       █████╗   ╚███╔╝    ██║   ██████╔╝███████║██║        ██║   
echo       ██╔══╝   ██╔██╗    ██║   ██╔══██╗██╔══██║██║        ██║   
echo       ███████╗██╔╝ ██╗   ██║   ██║  ██║██║  ██║╚██████╗   ██║   
echo       ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝
echo.
echo.

tar.exe -xf "%USERPROFILE%\Desktop\DS4 Windows by Mathys M.7z" -C "%USERPROFILE%\Desktop"

if %ERRORLEVEL% neq 0 (
    echo.
    echo ERREUR : L'extraction a échoué
    echo.
    echo L'archive .7z n'a pas été supprimée
    echo.
    pause
    GOTO Menu
)

del /f /q "%USERPROFILE%\Desktop\DS4 Windows by Mathys M.7z"

GOTO Launch


:Launch
CLS
title %Logiciel% - Installation

echo Create by Mathys M - https://www.karde.me/mathysm
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

if exist "%USERPROFILE%\Desktop\DS4 Windows by Mathys M\DS4Windows.exe" (
    echo Si tu as un choix entre "Appdata" et "Program Folder", choisi "Program Folder"
    echo.
    echo Le dossier a été placé sur le Bureau
    start "" /D "%USERPROFILE%\Desktop\DS4 Windows by Mathys M" "DS4Windows.exe"
    echo.
    pause
    GOTO Menu
) else (
    echo ERREUR : DS4Windows.exe est introuvable
    pause
    GOTO Menu
)

GOTO Menu


:ASCIIDrivers
title %Logiciel% - Installation des drivers

echo Create by Mathys M - https://www.karde.me/mathysm
echo.
echo.
echo       ██████╗ ██████╗ ██╗██╗   ██╗███████╗██████╗ ███████╗
echo       ██╔══██╗██╔══██╗██║██║   ██║██╔════╝██╔══██╗██╔════╝
echo       ██║  ██║██████╔╝██║██║   ██║█████╗  ██████╔╝███████╗
echo       ██║  ██║██╔══██╗██║╚██╗ ██╔╝██╔══╝  ██╔══██╗╚════██║
echo       ██████╔╝██║  ██║██║ ╚████╔╝ ███████╗██║  ██║███████║
echo       ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚══════╝
echo.
echo.
exit /b