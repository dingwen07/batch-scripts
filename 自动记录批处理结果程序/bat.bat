@echo off
::命令区
net user
systeminfo
ipconfig

































::命令区结束
::不要修改后面的命令
echo End time:%date% %time%
echo.
echo.
echo.
copy /b part1.txt + /b part2.txt /b log.txt>nul
del part1.txt>nul
del part2.txt>nul

