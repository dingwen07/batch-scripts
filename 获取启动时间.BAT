@echo off
PATH C:\Program Files (x86)\iBAT\Functions\;%PATH%
setlocal ENABLEEXTENSIONS
call Uptime d h n s
echo/系统运行了：%d% 天，%h% 小时，%n% 分，%s% 秒。
pause