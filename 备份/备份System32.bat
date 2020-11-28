@echo off
set /p disk=请输入您要备份的目标磁盘卷标：
md %disk%:\bakup
md %disk%:\bakup\System32
echo 正在备份备份System32...
copy C:\Windows\System32 %disk%:\bakup\System32
cls
Echo		文件备份完毕，任意键退出……
pause>nul