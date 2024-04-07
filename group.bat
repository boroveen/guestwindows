@echo off
goto init
:groupinit
net localgroup Пользователи "%newuser%" /delete
net localgroup Гости "%newuser%" /add
exit
:init
