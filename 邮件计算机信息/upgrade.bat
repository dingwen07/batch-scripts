@echo off
echo Host: %computername%>upgradelog.txt
echo User: %username%>>upgradelog.txt
echo [%date%%time%] Upgrade begin...>>upgradelog.txt

del newver.txt
rd /s /q upgrade\>nul

echo [%date%%time%] Downloading version file...>>upgradelog.txt
wget -o getv.txt mailspy.extrawdw.net/upgrade/newver.txt
type getv.txt>>upgradelog.txt
del getv.txt
set temp=Unknown
if not exist newver.txt (
echo [%date%%time%] Unable to download version file.>>upgradelog.txt
goto fail
)
set /a s=16
for %%i in ("newver.txt") do (
if %%~zi gtr %s% (
echo [%date%%time%] Invalid version file.>>upgradelog.txt
goto fail
)
)
set /P temp=<newver.txt
type ver.txt | findstr "%temp%"&&goto 1||goto 0
:1
del newver.txt
del upgradelog.txt
exit
:0
echo [%date%%time%] New version found: "%temp%".>>upgradelog.txt
echo [%date%%time%] Starting update...>>upgradelog.txt
mkdir upgrade
type newver.txt>>ver.txt
echo.>>ver.txt
echo [%date%%time%] Downloading upgrade package...>>upgradelog.txt
wget -o getp.txt mailspy.extrawdw.net/upgrade/package.rar
type getp.txt>>upgradelog.txt
del getp.txt
if not exist package.rar (
echo [%date%%time%] Unable to download upgrade package.>>upgradelog.txt
goto fail
)
move package.rar upgrade\package.rar
echo [%date%%time%] Unpacking upgrade package...>>upgradelog.txt
rar\rar.exe x upgrade\package.rar upgrade\>>upgradelog.txt
if not exist upgrade\upgrade.bat (
echo [%date%%time%] Invalid upgrade package.>>upgradelog.txt
goto fail
)
echo [%date%%time%] Upgrading...>>upgradelog.txt
start /b /wait cmd /c upgrade\upgrade.bat
echo [%date%%time%] Upgrade completed!>>upgradelog.txt
goto report

:fail
echo [%date%%time%] Upgrade exit with an error.>>upgradelog.txt

:report
echo %computername%\%username% UPGRADE REPORT>subj.txt
set from=mythware@yeah.net
set user=mythware
set pass=cysb4321
set to=15158879870@139.com
::set subj=""%computername%\%username% UPGRADE REPORT""
set mail=upgradelog.txt
set attach=upgradelog.txt
set server=smtp.yeah.net
set debug=-debug -log blat.log -timestamp
::blat "%mail%" -to %to% -base64 -charset Gb2312 -subject "%subj%" -attach %attach% -server %server% -f %from% -u %user% -pw %pass% %debeg%
blat "%mail%" -to %to% -base64 -charset Gb2312 -sf subj.txt -attach %attach% -server %server% -f %from% -u %user% -pw %pass% %debeg%
rd /s /q upgrade\
del getv.txt
del getp.txt
del newver.txt
del subj.txt
del upgradelog.txt
exit