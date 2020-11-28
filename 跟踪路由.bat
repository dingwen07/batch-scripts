@echo off
:start
cls
set /p ip="Host Name>"
set hop=30
set /p hop="Maximun Hops>"
TRACERT  /h %hop% %ip%
pause
goto start