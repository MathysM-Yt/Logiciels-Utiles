@echo off
chcp 65001 >nul
setlocal EnableExtensions
CLS

:: =============
:: Config du script
:: =============

set "Logiciel=Streaming Enhanced"

:: Vidéo Youtube
set "Presentation=https://youtu.be/zPQPPYAzB94"

:: Extension Chromium
set "Chromium=https://chromewebstore.google.com/detail/streaming-enhanced-netfli/akaimhgappllmlkadblbdknhbfghdgle"

:: Extension Firefox
set "Firefox=https://addons.mozilla.org/fr/firefox/addon/netflix-prime-auto-skip/"

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
echo 2. Extension Chromium
echo 3. Extension Firefox
echo.

CHOICE /C 123 /M "Entre ton choix:"

IF ERRORLEVEL 3 GOTO Firefox
IF ERRORLEVEL 2 GOTO Chromium
IF ERRORLEVEL 1 GOTO Presentation


:Presentation
CLS

start "" "%Presentation%"

GOTO Menu


:Chromium
CLS

start "" "%Chromium%"

GOTO Menu


:Firefox
CLS

start "" "%Firefox%"

GOTO Menu