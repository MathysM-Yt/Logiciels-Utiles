@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: =============
:: Config du script
:: =============

set "Logiciel=PushFPS"

:: Vidéo Youtube
set "Presentation=https://youtu.be/02VQ5VfDq5M"

:: Site officiel / Github
set "Github=https://github.com/DosukaSOL/PushFPS"

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
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; $ErrorActionPreference='Stop'; try { $r=Invoke-RestMethod -Uri 'https://api.github.com/repos/DosukaSOL/PushFPS/releases/latest' -Headers @{'Accept'='application/vnd.github+json'}; $a=$r.assets | Where-Object { $_.name -match '^PushFPS-.*-win64\.zip$' } | Select-Object -First 1; if (-not $a) { throw 'Archive ZIP PushFPS win64 introuvable dans la dernière release.' }; $d=[Environment]::GetFolderPath('Desktop'); $z=Join-Path $d $a.name; $e=Join-Path $d 'PushFPS'; Invoke-WebRequest -UseBasicParsing -Uri $a.browser_download_url -OutFile $z; if (Test-Path $e) { Remove-Item $e -Recurse -Force }; Expand-Archive -LiteralPath $z -DestinationPath $e -Force; Remove-Item $z -Force; $p=Join-Path $e 'Install-PushFPS.ps1'; if (-not (Test-Path $p)) { throw 'Install-PushFPS.ps1 introuvable après extraction.' }; & $p -ExperimentalExtras Yes; if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) { exit $LASTEXITCODE }; if (-not (Test-Path (Join-Path $env:LOCALAPPDATA 'Programs\PushFPS\PushFPS.exe'))) { throw 'L installation de PushFPS ne semble pas avoir abouti.' } } catch { Write-Host ('ERREUR : ' + $_.Exception.Message); exit 1 }"
set "InstallError=%ERRORLEVEL%"
chcp 65001 >nul

if not "%InstallError%"=="0" (
    echo ERREUR : Le téléchargement ou l'installation a échoué
    echo.
    pause
    GOTO Menu
)

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