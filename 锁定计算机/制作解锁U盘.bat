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

set /p disk=请输入盘符，如H_


IF EXIST "%disk%:" (echo 我们需要验证这是不是USB存储器，请拔出U盘并稍等片刻&goto out) ELSE (echo 盘符无效！&pause)
exit

:write
mkdir %disk%:\usbtab
ATTRIB +S +H "%disk%:\usbtab"
cls
set n=%computername%
set Nname=%n%
echo %Nname%>>%disk%:\usbtab\lock.txt
echo 写入完成
pause
exit


:out
ping /n 5 127.0.0.1>nul
IF NOT EXIST "%disk%:" (echo 请再次插入U盘并稍等片刻&goto in) ELSE (goto out)

:in
ping /n 5 127.0.0.1>nul
IF EXIST "%disk%:" (goto write) ELSE (goto in)

