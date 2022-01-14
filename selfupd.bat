@echo off
color 01
title WinDOS 3.4 Updater
echo Checking version...
if not exist unzip.exe echo unzip.exe not found! & pause & exit
powershell -Command "Invoke-WebRequest https://github.com/TartSoft/ver_WinDOS-3.4/archive/refs/heads/main.zip -OutFile main.zip" > nul
unzip.exe main.zip
move .\ver_WinDOS-3.4-main\ver.txt .\ver-new.txt
rd ver_WinDOS-3.4-main
Del main.zip
fc ver-new.txt ver.txt
if %errorlevel% == 1 goto downupdate
goto done
:done
cls
echo you are up to date!
Del ver-new.txt
pause
exit
:downupdate
cls
echo you have a new version do you want to update?
echo:---------------------------
echo version: && type ver-new.txt && echo.
echo:---------------------------
set /p Location=Type where you want the WinDOS folder to placed eg. [Drive:][path]
echo Downloading update...
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" powershell -Command "Invoke-WebRequest https://github.com/congaterori/WinDOS-3.4/archive/refs/heads/main.zip -OutFile main.zip"
if "%version%" == "6.1" powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/congaterori/WinDOS-3.4/archive/refs/heads/main.zip', 'main.zip')"
echo.
Del ver-new.txt
echo Unzip files...
unzip.exe WinDOS-3.4-main.zip
echo.
echo Move files to location...
MOVE /Y .\WinDOS-3.4-main %Location%
echo.
echo Finish!
echo The Updater will exit in:
timeout 10
endlocal
exit
