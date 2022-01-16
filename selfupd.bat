:: A new update for WinDOS3 

:: WinDOS3 Update 4
:: Contributed by TartSoft (duongletrieu)
:: Made In Hanoi, VN

:: This Program is under GNU General Public License. To see
:: the license go to this link:
:: https://github.com/TartSoft/WDOS3/blob/main/LICENSE.md
:: edited by johnny20061234
:: code edited based on congaterori/Windows_virtual_PC
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
if exist password.txt goto login
:signup
cls
echo  -----------------
echo       Sign up:     
echo  -----------------
echo.
echo -----------------------------------
echo Please type your new password here 
echo -----------------------------------
set /p password=
echo %password% > password.txt
:login
cls
echo  -----------------
echo       Login:     
echo  -----------------
echo.
echo -------------------------------
echo Please type your password here 
echo -------------------------------
setlocal DisableDelayedExpansion
set "psCommand=powershell -Command "$pword = read-host 'Enter password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set passwords=%%p
)

for /f "Delims=" %%a in (password.txt) do set pass=%%a
if %passwords% == %pass% goto mainscr
if not %passwords% == %pass% goto error
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
goto mainscr
:notepad
cls
call notepad.bat
goto mainscr
:dealornodeal
cls
call dealornodeal.bat
goto mainscr
:snake
cls
call snakexz.bat
goto mainscr
:minesweeper
cls
call minesweeper.bat
goto mainscr
:exit
cls
call startmn.bat
goto mainscr
