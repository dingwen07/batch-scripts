@Echo Off
color 1f

:del
cls
Echo					�ļ�ɾ��������
Echo		��ɾ�����ļ������ڻ���վ���ҵ��������������
if exist %1 goto c
goto err
:c
Echo.
Echo ��Ҫɾ�����ļ��ǣ�%1
Echo.
Echo		[1] ɾ�����ļ�
Echo		[2] ɾ�����ļ����Ի�
Echo		[0] �˳�
Echo.

Set /p del=	����������ѡ��(1/2/0):
If "%del%"=="1" Goto del1
If "%del%"=="2" Goto del1a
If "%del%"=="0" Exit
Exit

:del1
DEL /F /A /Q \\?\%1
RD /S /Q \\?\%1  
cls
Echo		�ļ�ɾ����ϣ�������˳�����
pause>nul
Exit


:del1a
DEL /F /A /Q \\?\%1
RD /S /Q \\?\%1  
cls
Echo		�ļ�ɾ����ϣ�������˳�����
pause>nul
DEL %0
Exit

:err
echo ���϶�Ҫɾ�����ļ������������£�Ȼ��ſ���
pause.