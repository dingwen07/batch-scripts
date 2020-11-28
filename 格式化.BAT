@echo off
title 格式化
color 4
set /p disk=要格式化的盘符：
msg Administrator 用户%username%正在格式化%disk%，请注意！
cls
set /p if=确定要格式化%disk%?(Y/N)
if %if% == Y goto yes
if %if% == N goto no
msg Administrator 用户%username%的格式化操作已取消！
exit
:yes
ping /n 10 localhost>nul
format /q %disk%
pause
:no
msg Administrator 用户%username%的格式化操作已取消！
exit


