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
set /p identifier="Please input identifier>"
echo WARNING
echo This operation will apply a change on the registration table!
pause
echo Windows Registry Editor Version 5.00>set_identifier_temp.reg
echo.>>set_identifier_temp.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE]>>set_identifier_temp.reg
echo "IdentificationField"=dword:00000001>>set_identifier_temp.reg
echo "IdentificationFieldString"="%identifier%">>set_identifier_temp.reg
echo.>>set_identifier_temp.reg
regedit -s set_identifier_temp.reg
del set_identifier_temp.reg
pause