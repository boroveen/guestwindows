@echo off
goto init
:groupinit
net localgroup ���짮��⥫� "%newuser%" /delete
net localgroup ���� "%newuser%" /add
exit
:init
