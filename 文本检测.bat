@ECHO OFF
set /p str=�������ļ�	
set /p i=Ҫ�����ַ���������������
cls
findstr "%i%" "%str%"&&goto 1||goto 0

goto 0

:1
echo ���С�%i%��
pause
exit

:0
cls
echo û���ҵ���%i%��
pause
exit