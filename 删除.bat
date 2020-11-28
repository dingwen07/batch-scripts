@Echo Off
color 1f

:del
cls
Echo					文件删除器工具
Echo		被删除的文件不能在回收站中找到，请谨慎操作。
if exist %1 goto c
goto err
:c
Echo.
Echo 您要删除的文件是：%1
Echo.
Echo		[1] 删除此文件
Echo		[2] 删除此文件并自毁
Echo		[0] 退出
Echo.

Set /p del=	请输入您的选择(1/2/0):
If "%del%"=="1" Goto del1
If "%del%"=="2" Goto del1a
If "%del%"=="0" Exit
Exit

:del1
DEL /F /A /Q \\?\%1
RD /S /Q \\?\%1  
cls
Echo		文件删除完毕，任意键退出……
pause>nul
Exit


:del1a
DEL /F /A /Q \\?\%1
RD /S /Q \\?\%1  
cls
Echo		文件删除完毕，任意键退出……
pause>nul
DEL %0
Exit

:err
echo 请拖动要删除的文件至此批处理下，然后放开！
pause.