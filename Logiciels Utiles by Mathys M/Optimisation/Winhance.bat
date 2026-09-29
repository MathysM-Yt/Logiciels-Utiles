@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: =============
:: Config du script
:: =============

set "Logiciel=Winhance"

:: Vidéo Youtube
set "Presentation=https://youtu.be/OlUE9uPiR70"

:: Site officiel / Github
set "Github=https://github.com/memstechtips/Winhance"

:: Installation automatique
set "Install=winget.exe install --id memstechtips.Winhance --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force"

:: ============
:: Fin de la config
:: ============


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
echo 4. Mes settings Windhance
echo.

CHOICE /C 1234 /M "Entre ton choix:"

IF ERRORLEVEL 4 GOTO Settings
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

%Install%

echo.
echo.
echo Installation terminée !
echo.
choice /c:yn /n /m "Veux-tu le fichier avec mes settings? [Y]es/[N]o"

if %ERRORLEVEL% == 1 GOTO Settings
if %ERRORLEVEL% == 2 GOTO Menu

:Settings
CLS

title %Logiciel% - Mes settings

echo Create by Mathys M - karde.me/mathysm
echo.
echo.
echo       ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
echo       ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
echo       ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
echo       ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
echo       ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
echo       ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝                                                                
echo.
echo.

chcp 850 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -UseBasicParsing -Uri 'https://MathysM-Yt.github.io/Logiciels-Utiles/Ressources/Winhance%%20Config%%20by%%20Mathys%%20M.winhance' -OutFile ([Environment]::GetFolderPath('Desktop') + '\Winhance Config by Mathys M.winhance')"
chcp 65001 >nul

if %ERRORLEVEL% neq 0 (
    echo ERREUR : Le téléchargement a échoué
    echo.
    pause
    GOTO Menu
)

echo Le fichier a été placé sur le Bureau
echo.
echo Avant d’appliquer mes réglages, vérifie manuellement les modifications (voir la vidéo si besoin)
echo.
pause
GOTO Menu