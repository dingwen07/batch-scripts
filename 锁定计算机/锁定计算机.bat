@echo off
del c:\computercomp\locked.txt
cls
title ���������
set n=%computername%
set Nname=%n%
set a=4
set pass=0
set password=0
echo ��ˢ�������Ա������沼��
ping /n 4 localhost>nul
cls
set /p pass=������Ԥ�����룺
start secomp.bat
cls
taskkill /f /im explorer.exe>nul
mkdir c:\computercomp>nul
echo.>c:\computercomp\locked.txt
echo %date% %time% This computer has been locked by %username% using password "%pass%".>>c:\computercomp\locklog.txt 
cls
title �˼��������%username%����
:123
cls
IF %a% LEQ 0 (goto lock)
set /p password=���������룺
cls
if %password% == %pass% goto 1
goto 2

:1
cls
echo %date% %time% This computer has been unlocked by user "%username%" using password "%pass%".>>c:\computercomp\locklog.txt
title ������ѽ���
echo ������ѽ�������������Ҫ�������������ļ���
del c:\computercomp\locked.txt
start explorer.exe
pause
exit

:2
cls
echo At %date% %time%,someone try to use the password "%password%" to unlock the computer.>>c:\computercomp\locklog.txt
set /a a=a-1
IF %a%==0 (goto lock)
echo �������,������!
echo ������%a%�λ��ᡣ
pause
goto 123

:lock
echo At %date% %time%,someone try to unlock the computer unlawful.>>c:\computercomp\locklog.txt
cls
echo �����ֹ����²����룬��ס Winsows�ձ��+LȻ��ע���������ṩ����USB��������ע�⣬ֻ�����ڱ��������Ľ���USB���������������ϣ��ͨ��USB������������������밴�����������
pause>nul
start listvol.bat
set /p disk=������USB�������̷�_
IF EXIST "%disk%:" (goto write) ELSE (echo �̷���Ч&pause)
goto lock

:write
IF NOT EXIST "%disk%:\usbtab\lock.txt" (echo �����������ǽ���������������û��Ȩ�޶�ȡ��USB������&pause&goto lock)
findstr "%Nname%" "%disk%:\usbtab\lock.txt"&&goto 1||goto no

:no
echo At %date% %time%,someone try to use unlawful USB disk to unlock this computer.>>c:\computercomp\locklog.txt
cls
echo ��USB�������޷�������̨�����
pause
goto lock
