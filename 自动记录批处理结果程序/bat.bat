@echo off
::������
net user
systeminfo
ipconfig

































::����������
::��Ҫ�޸ĺ��������
echo End time:%date% %time%
echo.
echo.
echo.
copy /b part1.txt + /b part2.txt /b log.txt>nul
del part1.txt>nul
del part2.txt>nul

