@echo off
setlocal enabledelayedexpansion
goto init
:main
set count=1
set "co=!COMPUTERNAME!"
:loo
set "co=%co:~1%"
if not "%co%"=="" (
	set /a count+=1
	goto loo
)
for /f "tokens=*" %%a in ('wmic computersystem get username /value ^| findstr /r /c:"User"') do (
	set "wlantmp=%%a"
	set "wlanzero=!wlantmp:~10!"
	set "wlanzero=!wlanzero:~%count%!"
)
if "%wlanzero%"=="%newuser%" (goto lock) else (goto ignor)
:lock
start C:\Users\!rootuser!\AppData\Roaming\AdminBat\wifi.bat
diskpart /s C:\Users\!rootuser!\AppData\Roaming\AdminBat\diskpartscript.txt
exit
:ignor
diskpart /s C:\Users\!rootuser!\AppData\Roaming\AdminBat\diskpartscripti.txt
exit
:init
