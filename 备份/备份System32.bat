@echo off
set /p disk=��������Ҫ���ݵ�Ŀ����̾�꣺
md %disk%:\bakup
md %disk%:\bakup\System32
echo ���ڱ��ݱ���System32...
copy C:\Windows\System32 %disk%:\bakup\System32
cls
Echo		�ļ�������ϣ�������˳�����
pause>nul