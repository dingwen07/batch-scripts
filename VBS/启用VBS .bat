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
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wscript.exe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cscript.exe" /f
pause
