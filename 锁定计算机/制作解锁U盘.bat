@echo off
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

set /p disk=�������̷�����H_


IF EXIST "%disk%:" (echo ������Ҫ��֤���ǲ���USB�洢������γ�U�̲��Ե�Ƭ��&goto out) ELSE (echo �̷���Ч��&pause)
exit

:write
mkdir %disk%:\usbtab
ATTRIB +S +H "%disk%:\usbtab"
cls
set n=%computername%
set Nname=%n%
echo %Nname%>>%disk%:\usbtab\lock.txt
echo д�����
pause
exit


:out
ping /n 5 127.0.0.1>nul
IF NOT EXIST "%disk%:" (echo ���ٴβ���U�̲��Ե�Ƭ��&goto in) ELSE (goto out)

:in
ping /n 5 127.0.0.1>nul
IF EXIST "%disk%:" (goto write) ELSE (goto in)

