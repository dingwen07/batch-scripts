@echo off
title  WiFi�ȵ㴴������
color 3f
mode con: cols=58 lines=22

:mainmenu
cls
echo   ������������������������������������������������������
echo   ��                WiFi�ȵ㴴������                  ��
echo   ��                                                  ��
echo   ��1����������WiFi���� ������ʱ��Ҫ�����˺ź����룩  ��
echo   ��2��ɾ������WiFi����                               ��
echo   ��3������WiFi�ȵ�     ����������WiFi�������ٿ�����  ��
echo   ��4���ر�WiFi�ȵ�                                   ��
echo   ��                                                  ��
echo   ��5��ʹ�ý̳�                                       ��
echo   ��6���鿴WiFi��Ϣ     ���ɲ鿴WiFi�˺��������Ϣ��  ��
echo   ��7���޸�WiFi����                                   ��
echo   ��8����������Ƿ�֧��                               ��
echo   ��                                                  ��
echo   ��9���˳�����                                       ��
echo   ������������������������������������������������������
echo.
set /p select="  ����������ѡ��[�س���ȷ��]:"
if "%select%" == "1" (goto :create) else (
if "%select%" == "2" (goto :delete) else (
if "%select%" == "3" (goto :open) else (
if "%select%" == "4" (goto :close) else (
if "%select%" == "5" (goto :introduce) else (
if "%select%" == "6" (goto :information) else (
if "%select%" == "7" (goto :password) else (
if "%select%" == "8" (goto :note) else (
if "%select%" == "9" (goto :quit) else (goto :error)))))))))

:create
cls
@rem �򿪷��񣬿�����ЩWIFI��Ҫ��ϵͳ����
sc config BFE start= demand>nul 2>nul
net start BFE>nul 2>nul
sc config mpsdrv start= demand>nul 2>nul
net start mpsdrv>nul 2>nul
sc config MpsSvc start= auto>nul 2>nul
net start MpsSvc>nul 2>nul
echo   ������������������������������������������������������
echo   ��                                                  ��
echo   ��            [����WiFi��������ҳ��]                ��
echo   ��                                                  ��
echo   ��     �˺Ų���Ϊ�����֣�����λ����������8λ        ��
echo   ��                                                  ��
echo   ������������������������������������������������������
set /p username=��������Ҫ���õ�WiFi�˺ţ�
set /p password=��������Ҫ���õ�WiFi���루����8λ����
echo %username% %password%>%systemroot%\system\userinfo.txt 2>nul
netsh wlan set hostednetwork mode=allow ssid=%username% key=%password% keyusage=persistent>nul
if %errorlevel% == 0 (
echo.
echo ����ִ�гɹ�...
echo.
echo ����WIFI�˺�Ϊ��[%username%] ����Ϊ��[%password%]]
echo.
echo   [��ʾ���뷵�����˵�ѡ3����WiFi�ȵ㣬�ٲο��̳�����]
) else (echo ����ִ��ʧ�ܣ�����λ������8λ������ԭ��...) 
echo.
echo.
echo ��������󣬽��������˵�...
pause>nul 2>nul
goto :mainmenu

:delete
cls
echo   ������������������������������������������������������
echo   ��                                                  ��
echo   ��            [ɾ������WiFi����ҳ��]                ��
echo   ��                                                  ��
echo   ��     ������û�д���������WiFi������ɾ������Ч��   ��
echo   ��                                                  ��
echo   ������������������������������������������������������
netsh wlan stop hostednetwork>nul
netsh wlan set hostednetwork mode=disallow>nul
if %errorlevel% == 0 (echo ����ִ�гɹ�...) else (echo ����ִ��ʧ�ܣ��Ƿ�δ������������WiFi������) 
del /f %systemroot%\system\userinfo.txt>nul 2>nul
echo.
echo ��������󣬽��������˵�...
pause>nul 2>nul
goto :mainmenu

:open
cls
echo   ������������������������������������������������������
echo   ��                                                  ��
echo   ��                [����WiFi�ȵ�ҳ��]                ��
echo   ��                                                  ��
echo   ��      ���ǿ���ʧ�ܣ��������ʾ���ݽ��ж�Ӧ����    ��
echo   ��                                                  ��
echo   ��       ע:�����ɹ�����ο��̳̽����������      ��
echo   ��                                                  ��
echo   ������������������������������������������������������
netsh wlan start hostednetwork>nul
if %errorlevel% == 0 (
echo.
echo     [�ȵ㿪���ɹ��������������������ҳ��...]&pause>nul&start control ncpa.cpl>nul
) else (
echo.
echo   [����ִ��ʧ�ܣ����Ƿ�δ����������WiFi������]
echo.
echo   �������WiFi�����Ƿ�����һ��ͨ��Fn+F3��ݼ�������[����Fn+F1~F12�������߱�־���Ǹ����е�ΪFn+F2��Fn+F12��]
) 

echo.
echo ��������󣬽��������˵�...
pause>nul 2>nul
goto :mainmenu

:close
cls
echo   ������������������������������������������������������
echo   ��                                                  ��
echo   ��              [�ر�WiFi�ȵ�ҳ��]                  ��
echo   ��                                                  ��
echo   ��      ������û�п�����WiFi�ȵ㣬�ر�Ҳ����Ч��    ��
echo   ��                                                  ��
echo   ������������������������������������������������������
netsh wlan stop hostednetwork>nul
if %errorlevel% == 0 (echo ����ִ�гɹ�...) else (echo ����ִ��ʧ�ܣ�WiFi�ȵ�û�п�������������ԭ��) 
echo.
echo ��������󣬽��������˵�...
pause>nul 2>nul
goto :mainmenu

:information
cls
echo   ������������������������������������������������������
echo   ��                                                  ��
echo   ��                 [WiFi�ȵ���Ϣ]                   ��
echo   ��         �鿴���ӵ���ǰWiFi�ȵ���û���Ϣ         ��
echo   ��                                                  ��
echo   ������������������������������������������������������
if exist %systemroot%\system\userinfo.txt (
for /f "tokens=1,2 delims= " %%i in (%systemroot%\system\userinfo.txt) do (
echo ��ǰWiFi�ȵ��˺�Ϊ��%%i    ����Ϊ��%%j&echo.)
) else (
echo     [��û������WiFi�ȵ�,�����û���Ϣ�ļ�δ�����ɹ�...]
echo.
)
call :getinfo



:introduce
cls
echo   ������������������������������������������������������
echo   ��        WiFi�ȵ㴴������Ver2.0[ʹ�÷���]          ��
echo   ��                                                  ��
echo   ��A������һ��ʹ�ã���ѡ1�����˺����룬Ȼ��ѡ3������ ��
echo   ��B���ɹ�����Զ��򿪡����������á�ҳ�棬Ȼ�����£� �� 
echo   ��                                                  ��
echo   ��C����������ʹ�ÿ�����ӻ򲦺������������²������� ��
echo   ��D��[�������]--����--����--��ѡ�������������û�...��
echo   ��E������ѡ��������������2�����ο����������.png����
echo   ��                                                  ��
echo   ��F����������ʹ�õ�У԰����������������²�������   ��
echo   ��G��[��������]--����--����--��ѡ�������������û�...��
echo   ��H������ѡ��������������2�����ο���������.png��  ��
echo   ��                                                  ��
echo   �����������ú󻹲�����������ѡ4�ر��ȵ����ѡ3��������
echo   ��                                                  ��
echo   ��                                                  ��
echo   ������������������������������������������������������
echo.
echo ��������󣬽��������˵�...
pause>nul 2>nul
goto :mainmenu


:password
cls
echo   ������������������������������������������������������
echo   ��                                                  ��
echo   ��            [�޸�WiFi�ȵ�����ҳ��]                ��
echo   ��                                                  ��
echo   ��   �������������棬����3ѡ�ر�WiFi�ȵ㣬���޸�    ��
echo   ��       ���������룬���س�ȷ�ϼ����޸ĳɹ�         ��
echo   ��                                                  ��
echo   ������������������������������������������������������
set /p pwd=��������Ҫ���õ�������[������8λ]��

if exist %systemroot%\system\userinfo.txt (
for /f "tokens=1,2 delims= " %%i in (%systemroot%\system\userinfo.txt) do (set "username=%%i"))   &@rem ��ȡ��ǰWiFi�˻�

netsh wlan set hostednetwork key=%pwd% >nul
if %errorlevel% == 0 (
echo   ��ϲ���������޸ĳɹ�...
if exist %systemroot%\system\userinfo.txt (echo %username% %pwd%>%systemroot%\system\userinfo.txt)
) else (echo   �����޸�ʧ�ܣ�����λ������8λ������ԭ��)
echo.
echo ��������󣬽��������˵�...
pause>nul 2>nul
goto :mainmenu


:note
cls
echo   ����������������������������������������������������
echo   ��                                                ��
echo   ��             [ϵͳ��ʾ�����м��]               ��
echo   ��                                                ��
echo   �� Win7��Win8ϵͳ���У���������Ҳ������ִ�����   ��
echo   ��          �����������Ƿ�֧�ֳ�������          ��
echo   ��                                                ��
echo   ����������������������������������������������������
echo.
netsh wlan show drivers|find "֧�ֵĳ�������  : ��">nul
if %errorlevel% == 0 ( echo          [��ⷢ������֧�֣����ĵ�ʹ�ðɣ�]) else ( echo          [��ⷢ���������ܲ�֧�֣������������ԡ�] )
echo.
echo ����������������س������˵�...
pause>nul 2>nul
goto :mainmenu



:getinfo
@rem  ��ȡ���ӵ���ǰWIFI�ȵ�  �ͻ��˵�IP��MAC��ַ��

@rem ���������ӳ�
setlocal enabledelayedexpansion    

@rem ��ȡ���ӵ���ǰWIFI�ȵ�Ŀͻ�������
for /f "skip=1 tokens=2 delims=:" %%i in ('netsh wlan show hostednetwork ^|find "�ͻ�����"') do (set clientsum=%%i)


echo            [���ӵ�����WiFi�ȵ�Ŀͻ�������Ϊ��!clientsum!]
echo.
set /a n=1
echo  ���   ����       MAC��ַ              IP��ַ


@rem ��ȡ��ͨ�������֤���û�MAC��ַ
for /f "tokens=1,2 delims= " %%i in ('netsh wlan show hostednetwork ^| find "�Ѿ��������֤"') do (
	set "clientmac=%%i"      
	@rem ���ҳ���mac��ַ��:�Ż���-��
	set  clientmac=!clientmac::=-!

	@rem ��arp�����б���ͨ��MAC�ҳ���Ӧ��IP
	for /f "tokens=1-3 delims= " %%a in ('arp -a^|find /i "!clientmac!"') do (
	set "clientip=%%a"
	set "clienttype=%%c" )
	echo  !n!      !clienttype!       !clientmac!    !clientip!
	set /a n=n+1
)
echo.  
echo ��������󣬽��������˵�...
pause>nul 2>nul
goto :mainmenu




:error
echo.
echo [����ѡ�񲻴��ڻ����������󣬰����������...]
pause>nul 2>nul
goto :mainmenu


:unname
@rem �����ʱδ�õ����е�ϵͳCMD��Ӣ�����ݣ�����Ҫ�����ˣ�û��Ҫ��
echo.
echo [����δ����WiFi�ȵ㣬�鿴�ȵ���Ϣ�ƺ�û��Ҫ����������������˵�...]
pause>nul 2>nul
goto :mainmenu


:quit
echo.
echo ��л����ʹ�ã���������˳�����...
pause>nul 2>nul
exit
