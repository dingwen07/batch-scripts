@Echo Off
color 1f

:del
cls

Echo					文件删除器工具
Echo.		被删除的文件不能在回收站中找到，请谨慎操作。
Echo.

Set /p del=	请输入要删除的文件:

DEL %del%
RD %del%
DEL %del%
RD %del%
DEL %del%
RD %del%
DEL %del%
RD %del%

cls
Echo		文件删除完毕，任意键返回……
pause>nul
Goto :del