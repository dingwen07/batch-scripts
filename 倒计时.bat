@echo off
title 倒计时
COLOR 21
set /p num=时间（秒）：
set /p program=执行的程序：
cls
for /L %%a in ( 
%num%,-1,0
) do ( 
echo 				倒计时剩余 %%a 秒 
echo 			    倒计时完成后将启动“%program%”
ping -n 2 localhost 1>nul 2>nul 
cls
)
start %program%
