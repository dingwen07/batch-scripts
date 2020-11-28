@echo off
set>1.txt
for /f %%a in (config.ini) do set "%%a"
set>2.txt
fc 1.txt 2.txt
pause