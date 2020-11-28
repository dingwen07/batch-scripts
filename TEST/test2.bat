@echo off
echo %username%  %date% %time%>>part1.txt


set /p input=ÇëÊäÈë£º 
net user>>part1.txt

echo.>>part1.txt
echo.>>part1.txt
copy log.txt part2.txt
copy /b part1.txt + /b part2.txt /b log.txt
del part1.txt
del part2.txt
exit

