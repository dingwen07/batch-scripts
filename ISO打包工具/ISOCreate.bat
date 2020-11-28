@ECHO OFF
set /P file="请拖入要打包的文件夹>"
set /P filen="请输入ISO文件名（不含后缀）>"
set /P path="请输入保存路径>"
ISOIMAGE -nt -h -m %file% %path%%filen%.ISO
pause
exit