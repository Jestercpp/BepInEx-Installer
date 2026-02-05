REM BepInEx Installer Script
REM Created with enhancements for clarity and uniqueness.
REM Save as .bat file and run to install BepInEx for Gorilla Tag.

@echo off
setlocal enabledelayedexpansion
chcp 65001
cls
title BepInEx Setup Utility v1.1 - [Initializing...]
color 0a

REM Define potential game installation paths
set "pathOption1=C:\Program Files (x86)\Steam\steamapps\common\Gorilla Tag"
set "pathOption2=D:\SteamLibrary\steamapps\common\Gorilla Tag"
set "pathOption3=C:\Program Files\Oculus\Software\Software\another-axiom-gorilla-tag"
set "pathOption4=D:\Steam\steamapps\common\Gorilla Tag"

REM Attempt to auto-detect game directory
set "installDir="
if exist "%pathOption1%" set "installDir=%pathOption1%"
if not defined installDir if exist "%pathOption2%" set "installDir=%pathOption2%"
if not defined installDir if exist "%pathOption3%" set "installDir=%pathOption3%"
if not defined installDir if exist "%pathOption4%" set "installDir=%pathOption4%"

REM Prompt user if not found
if not defined installDir (
    color 0c
    set /p "installDir=Please enter the Gorilla Tag installation directory: "
    if not exist "!installDir!" (
        echo Error: Specified directory does not exist.
        pause
        exit /b 1
    )
)

color 0a
cls
title BepInEx Setup Utility v1.1 - [Downloading BepInEx...]

REM Download the BepInEx archive
set "zipFile=BepInEx_x64_5.4.23.4.zip"
curl -L "https://github.com/BepInEx/BepInEx/releases/download/v5.4.23.4/BepInEx_win_x64_5.4.23.4.zip" -o "%zipFile%"

cls
title BepInEx Setup Utility v1.1 - [Extracting Files...]

REM Extract the archive to the game directory
powershell -command "Expand-Archive -Path '%zipFile%' -DestinationPath '!installDir!' -Force"

cls
title BepInEx Setup Utility v1.1 - [Installation Complete!]

echo Success! BepInEx has been installed in your Gorilla Tag directory.
del "%zipFile%"
pause