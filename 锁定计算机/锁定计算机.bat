@echo off
del c:\computercomp\locked.txt
cls
title 锁定计算机
set n=%computername%
set Nname=%n%
set a=4
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
echo 程序防止恶意猜测密码，按住 Winsows徽标键+L然后注销，或者提供解锁USB驱动器（注意，只适用于本机制作的解锁USB驱动器），如果您希望通过USB驱动器解锁计算机，请按任意键继续。
pause>nul
start listvol.bat
set /p disk=请输入USB驱动器盘符_
IF EXIST "%disk%:" (goto write) ELSE (echo 盘符无效&pause)
goto lock

:write
IF NOT EXIST "%disk%:\usbtab\lock.txt" (echo 该驱动器不是解锁驱动器或者你没有权限读取该USB驱动器&pause&goto lock)
findstr "%Nname%" "%disk%:\usbtab\lock.txt"&&goto 1||goto no

:no
echo At %date% %time%,someone try to use unlawful USB disk to unlock this computer.>>c:\computercomp\locklog.txt
cls
echo 该USB驱动器无法解锁这台计算机
pause
goto lock
