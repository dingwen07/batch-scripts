@echo off
set URL="http://mailspy.extrawdw.net/getip.php"
wget %URL% -O PublicIP.txt
set /p PublicIP=<PublicIP.txt