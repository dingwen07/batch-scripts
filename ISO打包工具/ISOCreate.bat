@ECHO OFF
set /P file="������Ҫ������ļ���>"
set /P filen="������ISO�ļ�����������׺��>"
set /P path="�����뱣��·��>"
ISOIMAGE -nt -h -m %file% %path%%filen%.ISO
pause
exit