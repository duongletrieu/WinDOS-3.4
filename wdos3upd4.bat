:: A new update for WinDOS3 

:: WinDOS3 Update 4
:: Contributed by TartSoft (duongletrieu)
:: Made In Hanoi, VN

:: This Program is under GNU General Public License. To see
:: the license go to this link:
:: https://github.com/TartSoft/WDOS3/blob/main/LICENSE.md
:: edited by johnny20061234
@echo off
chcp 65001
cls
color 02
title WinDOS3
type logo.txt
echo Loading, Please Wait...
timeout 4 > NUL
cls
echo Booting up WinDOS3...
timeout 2 > NUL
echo Checking files...
timeout 2 >NUL 
echo Loading Updater...
call selfupd.bat
timeout 2 >NUL
:login
cls
echo  -----------------
echo       Login:     
echo  -----------------
echo.
echo -------------------------------
echo Please type your password here 
echo -------------------------------
echo pass:183456
set/p pass=
if %pass%==183456 goto mainscr
goto error
:error
msg * Your password is not correct. Please try again
goto login
:mainscr
cls
type logo.txt
echo --------------------------------
echo The current time is %time%
echo.
echo The current date is %date%
echo --------------------------------
echo.
echo  ╔════════════════════════════════════════╗
echo  ║                Main Menu               ║
echo  ╚════════════════════════════════════════╝
echo ----------------------------------------------
echo  Menu: Please type a number to open a program
echo ----------------------------------------------
echo.
echo --------------------
echo ACCESORIES
echo --------------------
echo 1.Calculator 
echo 2.Notepad
echo --------------------
echo GAMES
echo --------------------
echo 3.Deal or no Deal 
echo 4.Snake Xenzia
echo 5.Miesweeper
echo --------------------
echo [TYPE 7] SHUTDOWN
echo --------------------
set /p input= 
if %input%==1 goto calc 
if %input%==2 goto notepad
if %input%==3 goto dealornodeal
if %input%==4 goto snake
if %input%==5 goto minesweeper
if %input%==7 goto exit
:calc
cls
call calc.bat
:notepad
cls
call notepad.bat
:dealornodeal
cls
call dealornodeal.bat
:snake
cls
call snakexz.bat
:minesweeper
cls
call minesweeper.bat
:exit
cls
call startmn.bat
