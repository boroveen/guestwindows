@echo off
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in ('netsh wlan show interfaces ^| findstr /r /c:"ˆ¬ï"') do (
	set "wlantmp=%%a"
	set "wland=!wlantmp:~36!"
)

netsh interface set interface name="!wland!" admin=DISABLE