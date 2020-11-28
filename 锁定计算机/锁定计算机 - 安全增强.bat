@echo off
del c:\computercomp\locked.txt
cls
title 锁定计算机
set n=%computername%
set Nname=%n%
set a=3
set pass=0
set password=0
echo 请刷新桌面以保存桌面布局
ping /n 4 localhost>nul
cls
set /p pass=请输入预设密码：
start secomp.bat
cls
taskkill /f /im explorer.exe>nul
mkdir c:\computercomp>nul
echo.>c:\computercomp\locked.txt
echo %date% %time% This computer has been locked by %username% using password "%pass%".>>c:\computercomp\locklog.txt 
cls
title 此计算机已由%username%锁定
:123
cls
IF %a% LEQ 0 (goto lock)
set /p password=请输入密码：
cls
if %password% == %pass% goto 1
goto 2

:1
cls
echo %date% %time% This computer has been unlocked by user "%username%" using password "%pass%".>>c:\computercomp\locklog.txt
title 计算机已解锁
echo 计算机已解锁，您可能需要重新排列桌面文件。
del c:\computercomp\locked.txt
start explorer.exe
pause
exit

:2
cls
echo At %date% %time%,someone try to use the password "%password%" to unlock the computer.>>c:\computercomp\locklog.txt
set /a a=a-1
IF %a%==0 (goto lock)
echo 密码错误,请重试!
echo 您还有%a%次机会。
pause
goto 123

:lock
echo At %date% %time%,someone try to unlock the computer unlawful.>>c:\computercomp\locklog.txt
cls
shutdown /l