@echo off
set "URL=http://ip.chinaz.com/getip.aspx"
wget %URL% -O PublicIP.txt
set /p PublicIP=<PublicIP.txt
set PublicIP=%PublicIP:~5,15%