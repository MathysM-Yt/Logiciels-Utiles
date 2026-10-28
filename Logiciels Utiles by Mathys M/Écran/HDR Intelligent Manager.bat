@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: =============
:: Config du script
:: =============

set "Logiciel=HDR Intelligent Manager"

:: Vidéo Youtube
set "Presentation=https://youtu.be/yGCvZxl7zT0"

:: Site officiel / Github
set "Github=https://github.com/VantaCode420/SmartHdrManager"

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
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; $ErrorActionPreference='Stop'; try { $r=Invoke-RestMethod -Uri 'https://api.github.com/repos/VantaCode420/SmartHdrManager/releases/latest'; $a=$r.assets | Where-Object { $_.name -match '^SmartHdrManager-v.*-win-x64\.zip$' } | Select-Object -First 1; if (-not $a) { throw 'Archive ZIP introuvable dans la dernière release.' }; $o=[Environment]::GetFolderPath('Desktop'); $z=Join-Path $o $a.name; Invoke-WebRequest -UseBasicParsing -Uri $a.browser_download_url -OutFile $z; $e=Join-Path $o 'HDR Intelligent Manager'; if (-not (Test-Path $e)) { New-Item -ItemType Directory -Path $e | Out-Null }; Expand-Archive -LiteralPath $z -DestinationPath $e -Force; Remove-Item $z -Force; $x=Get-ChildItem -Path $e -Recurse -Filter 'SmartHdrManager.exe' | Select-Object -First 1; if (-not $x) { throw 'SmartHdrManager.exe introuvable après extraction.' }; Start-Process -FilePath $x.FullName } catch { Write-Host ('ERREUR : ' + $_.Exception.Message); exit 1 }"
chcp 65001 >nul

echo %Logiciel% a été placé sur le Bureau
echo.
pause
GOTO Menu