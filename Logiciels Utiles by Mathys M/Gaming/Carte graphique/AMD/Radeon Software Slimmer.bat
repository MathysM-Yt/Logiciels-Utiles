@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: =============
:: Config du script
:: =============

set "Logiciel=Radeon Software Slimmer"

:: Vidéo Youtube
set "Presentation=https://youtu.be/0jBuG7EEe2g"

:: Site officiel / Github
set "Github=https://github.com/GSDragoon/RadeonSoftwareSlimmer"

:: Installation automatique
set "Install=winget.exe install --id Microsoft.DotNet.DesktopRuntime.9 --exact --source winget --accept-source-agreements --disable-interactivity --silent --accept-package-agreements --force"

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

%Install%

chcp 850 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$r=Invoke-RestMethod 'https://api.github.com/repos/GSDragoon/RadeonSoftwareSlimmer/releases/latest'; $a=$r.assets | Where-Object { $_.name -match 'net9' -and $_.name -match '\.zip$' } | Select-Object -First 1; if (-not $a) { throw 'Asset .NET 9 introuvable dans la dernière release.' }; $d=Join-Path $env:TEMP $a.name; Invoke-WebRequest $a.browser_download_url -OutFile $d; $o=Join-Path ([Environment]::GetFolderPath('Desktop')) 'RadeonSoftwareSlimmer'; if (Test-Path $o) { Remove-Item $o -Recurse -Force }; Expand-Archive $d $o -Force; Remove-Item $d -Force; Start-Process (Get-ChildItem $o -Recurse -Filter 'RadeonSoftwareSlimmer.exe' | Select-Object -First 1).FullName"
chcp 65001 >nul

if %errorlevel% neq 0 (
    echo.
    echo ERREUR : Le téléchargement a échoué
    echo.
    pause
    GOTO Menu
)

echo.
echo Téléchargement terminé !
echo.
echo Le dossier a été placé sur le Bureau
echo.
pause
GOTO Quitter