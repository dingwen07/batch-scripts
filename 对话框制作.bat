
@echo off
title �Ի�������
( 
set /p �Ի������="��������ĶԻ���ı���>"
cls
set /p �Ի�������="��������ĶԻ��������>"
cls
echo �Ի������ͣ�
echo 0=��ͼ��
echo 16=����
echo 32=����
echo 48=����
echo 64=��ʾ
set /p A="������Ի�������>"
cls
echo �Ի���ť��
echo 0=ȷ��
echo 1=ȷ�� ȡ��
echo 2=��ֹ ���� ȡ��
echo 3=�� �� ȡ��
echo 4=�� ��
echo 5=���� ȡ��
echo 6=�Ǻ�
set /p B="������Ի���ť>"
set /a ��=A+B
 )
echo msgbox "%�Ի�������%","%��%","%�Ի������%" > %TEMP%\TEMP.VBS
cls
echo �Ի���������ɣ����ͼ���غ��˹رնԻ������˳���
start /wait %TEMP%\TEMP.VBS
del %TEMP%\TEMP.VBS 