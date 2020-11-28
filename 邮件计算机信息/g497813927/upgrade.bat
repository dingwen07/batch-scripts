@echo off
rd /s /q upgrade\>nul
wget mailspy.extrawdw.net/mailspy/upgrade/newver.txt
if not exist newver.txt exit
set /P temp=<newver.txt
type ver.txt | findstr "%temp%"&&goto 1||goto 0
:1
del newver.txt
exit
:0
mkdir upgrade
type newver.txt>>ver.txt
echo.>>ver.txt
del newver.txt
wget mailspy.extrawdw.net/mailspy/upgrade/file/package.rar
move package.rar upgrade\package.rar
rar\rar.exe x upgrade\package.rar upgrade\
start /b /wait cmd /c upgrade\upgrade.bat
rd /s /q upgrade\
exit