@echo off

set /p t=请输入您要修改的密码：

net user %username% %t%

echo 修改成功！

pause