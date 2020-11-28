@echo off
cls
set /p file="请拖入文件>"
if not exist %file% echo 文件不存在！&%0&exit
echo [%date% %time%] %file%>>report.txt
for /f %%a in (db.txt) do (findstr /offline /n "%%a" "%file%">>report.txt)
echo.>>report.txt
pause