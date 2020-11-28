@echo off
set "URL=http://www.ip138.com/ip2city.asp"
for /f "tokens=2 delims=[]" %%a in ('wget -q "%URL%" -O -') do (
    set "PublicIP=%%a"
)