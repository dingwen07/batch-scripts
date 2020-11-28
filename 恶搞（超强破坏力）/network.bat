@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
REM

:network
set n=0
netsh winsock reset
netsh interface set interface "本地连接" disabled
netsh interface set interface "无线网络连接" disabled
netsh interface set interface "WLAN" disabled
ipconfig /release
ipconfig /release6

:browser
taskkill /t /f /im "iexplore.exe"
taskkill /t /f /im "MicrosoftEdge.exe"
taskkill /t /f /im "Chrome.exe"
taskkill /t /f /im "Firefox.exe"
taskkill /t /f /im "360SE.exe"
taskkill /t /f /im "baidubrowser.exe"
taskkill /t /f /im "QQBrowser.exe"
taskkill /t /f /im "opera.exe"
taskkill /t /f /im "sogouexplorer.exe"
taskkill /t /f /im "Safari.exe"
taskkill /t /f /im "The world.exe"
taskkill /t /f /im "Maxthon.exe"
taskkill /t /f /im "Netscape.exe"

ping /n 10 localhost
set /a n=n+1
if n == 10 goto network
goto browser