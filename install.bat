@echo off
setlocal enabledelayedexpansion
title Create new user and setting
echo CREATING GUEST
set /p newuser=New username: 
net user "%newuser%" /add /active:yes /passwordreq:no /passwordchg:no

echo ADD GROUP
echo set newuser=%newuser% >> C:\Users\%username%\Desktop\guestwindows\group.bat
echo goto groupinit >> C:\Users\%username%\Desktop\guestwindows\group.bat
start C:\Users\%username%\Desktop\guestwindows\group.bat

echo SETTING FILE
echo set "newuser=%newuser%" >> C:\Users\%username%\Desktop\guestwindows\disable.bat
echo set "rootuser=%username%" >> C:\Users\%username%\Desktop\guestwindows\disable.bat
echo goto main >> C:\Users\%username%\Desktop\guestwindows\disable.bat
mkdir C:\Users\%username%\AppData\Roaming\AdminBat
move C:\Users\%username%\Desktop\guestwindows\diskpartscript.txt C:\Users\%username%\AppData\Roaming\AdminBat
move C:\Users\%username%\Desktop\guestwindows\diskpartscripti.txt. C:\Users\%username%\AppData\Roaming\AdminBat
move C:\Users\%username%\Desktop\guestwindows\wifi.bat C:\Users\%username%\AppData\Roaming\AdminBat
move C:\Users\%username%\Desktop\guestwindows\disable.bat C:\Users\%username%\AppData\Roaming\AdminBat

echo ADD AUTORUN 
schtasks /create /tn disable_wifi /tr C:\Users\Acer\AppData\Roaming\AdminBat\disable.bat /sc onlogon /ru System

pause
