@echo off
cls
set /p file="�������ļ�>"
if not exist %file% echo �ļ������ڣ�&%0&exit
echo [%date% %time%] %file%>>report.txt
for /f %%a in (db.txt) do (findstr /offline /n "%%a" "%file%">>report.txt)
echo.>>report.txt
pause