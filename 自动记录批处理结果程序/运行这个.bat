@echo off
del part1.txt
del part2.txt
cls
echo ��ȴ�������ִ�����
echo ������ڳ����˳���ɾ��"part1.txt"��Ҳ���Բ�ɾ
echo %computername%\%username%>>part1.txt
echo Start time:%date% %time%>>part1.txt
copy log.txt part2.txt>nul
bat.bat>>part1.txt
del part1.txt