@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
REM
mkdir %temp%\mylock
del %temp%\mylock\temp.txt
if exist c:\computercomp\locked.txt goto se
exit

:se
ping /n 2 localhost>nul
if not exist c:\computercomp\locked.txt exit
taskkill /f /im explorer.exe>%temp%\mylock\temp.txt
findstr "PID" "%temp%\mylock\temp.txt"&&goto st||goto se

:st
msg %username% 请不要尝试非法解锁计算机
echo At %date% %time%,someone try to use the "taskmgr" to crack computer lock.>>c:\computercomp\locklog.txt
del %temp%\mylock\temp.txt
goto se