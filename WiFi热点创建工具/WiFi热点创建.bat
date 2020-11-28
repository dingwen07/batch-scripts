@echo off
title  WiFi热点创建工具
color 3f
mode con: cols=58 lines=22

:mainmenu
cls
echo   ┌—————————————————————————┐
echo   │                WiFi热点创建工具                  │
echo   │                                                  │
echo   │1、创建虚拟WiFi网卡 （创建时需要设置账号和密码）  │
echo   │2、删除虚拟WiFi网卡                               │
echo   │3、开启WiFi热点     （创建虚拟WiFi网卡后再开启）  │
echo   │4、关闭WiFi热点                                   │
echo   │                                                  │
echo   │5、使用教程                                       │
echo   │6、查看WiFi信息     （可查看WiFi账号密码等信息）  │
echo   │7、修改WiFi密码                                   │
echo   │8、检测网卡是否支持                               │
echo   │                                                  │
echo   │9、退出程序                                       │
echo   └—————————————————————————┘
echo.
set /p select="  请输入数字选择[回车键确认]:"
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
@rem 打开服务，开启那些WIFI需要的系统服务
sc config BFE start= demand>nul 2>nul
net start BFE>nul 2>nul
sc config mpsdrv start= demand>nul 2>nul
net start mpsdrv>nul 2>nul
sc config MpsSvc start= auto>nul 2>nul
net start MpsSvc>nul 2>nul
echo   ┌—————————————————————————┐
echo   │                                                  │
echo   │            [虚拟WiFi网卡创建页面]                │
echo   │                                                  │
echo   │     账号不能为纯数字，密码位数不能少于8位        │
echo   │                                                  │
echo   └—————————————————————————┘
set /p username=请输入您要设置的WiFi账号：
set /p password=请输入您要设置的WiFi密码（至少8位）：
echo %username% %password%>%systemroot%\system\userinfo.txt 2>nul
netsh wlan set hostednetwork mode=allow ssid=%username% key=%password% keyusage=persistent>nul
if %errorlevel% == 0 (
echo.
echo 命令执行成功...
echo.
echo 您的WIFI账号为：[%username%] 密码为：[%password%]]
echo.
echo   [提示：请返回主菜单选3开启WiFi热点，再参考教程设置]
) else (echo 命令执行失败，密码位数少于8位或其他原因...) 
echo.
echo.
echo 按任意键后，将返回主菜单...
pause>nul 2>nul
goto :mainmenu

:delete
cls
echo   ┌—————————————————————————┐
echo   │                                                  │
echo   │            [删除虚拟WiFi网卡页面]                │
echo   │                                                  │
echo   │     若是您没有创建过虚拟WiFi网卡，删除是无效的   │
echo   │                                                  │
echo   └—————————————————————————┘
netsh wlan stop hostednetwork>nul
netsh wlan set hostednetwork mode=disallow>nul
if %errorlevel% == 0 (echo 命令执行成功...) else (echo 命令执行失败，是否未曾创建过虚拟WiFi网卡？) 
del /f %systemroot%\system\userinfo.txt>nul 2>nul
echo.
echo 按任意键后，将返回主菜单...
pause>nul 2>nul
goto :mainmenu

:open
cls
echo   ┌—————————————————————————┐
echo   │                                                  │
echo   │                [开启WiFi热点页面]                │
echo   │                                                  │
echo   │      若是开启失败，请根据提示内容进行对应操作    │
echo   │                                                  │
echo   │       注:开启成功后，请参考教程进行最后设置      │
echo   │                                                  │
echo   └—————————————————————————┘
netsh wlan start hostednetwork>nul
if %errorlevel% == 0 (
echo.
echo     [热点开启成功，按任意键打开网络连接页面...]&pause>nul&start control ncpa.cpl>nul
) else (
echo.
echo   [命令执行失败，您是否还未创建过虚拟WiFi网卡？]
echo.
echo   检查您的WiFi功能是否开启，一般通过Fn+F3快捷键开启。[即按Fn+F1~F12上有无线标志的那个，有的为Fn+F2或Fn+F12。]
) 

echo.
echo 按任意键后，将返回主菜单...
pause>nul 2>nul
goto :mainmenu

:close
cls
echo   ┌—————————————————————————┐
echo   │                                                  │
echo   │              [关闭WiFi热点页面]                  │
echo   │                                                  │
echo   │      若是您没有开启过WiFi热点，关闭也是无效的    │
echo   │                                                  │
echo   └—————————————————————————┘
netsh wlan stop hostednetwork>nul
if %errorlevel% == 0 (echo 命令执行成功...) else (echo 命令执行失败，WiFi热点没有开启过或者其它原因。) 
echo.
echo 按任意键后，将返回主菜单...
pause>nul 2>nul
goto :mainmenu

:information
cls
echo   ┌—————————————————————————┐
echo   │                                                  │
echo   │                 [WiFi热点信息]                   │
echo   │         查看连接到当前WiFi热点的用户信息         │
echo   │                                                  │
echo   └—————————————————————————┘
if exist %systemroot%\system\userinfo.txt (
for /f "tokens=1,2 delims= " %%i in (%systemroot%\system\userinfo.txt) do (
echo 当前WiFi热点账号为：%%i    密码为：%%j&echo.)
) else (
echo     [还没创建过WiFi热点,或者用户信息文件未创建成功...]
echo.
)
call :getinfo



:introduce
cls
echo   ┌—————————————————————————┐
echo   │        WiFi热点创建工具Ver2.0[使用方法]          │
echo   │                                                  │
echo   │A、若第一次使用，就选1输入账号密码，然后选3开启。 │
echo   │B、成功后会自动打开【适配器设置】页面，然后如下： │ 
echo   │                                                  │
echo   │C、【若您是使用宽带连接或拨号上网，请如下操作】： │
echo   │D、[宽带连接]--属性--共享--勾选允许其他网络用户...│
echo   │E、下面选择“无线网络连接2”，参考“宽带拨号.png”│
echo   │                                                  │
echo   │F、【若是您使用的校园网或局域网，请如下操作】：   │
echo   │G、[本地连接]--属性--共享--勾选允许其他网络用户...│
echo   │H、下面选择“无线网络连接2”，参考“局域网.png”  │
echo   │                                                  │
echo   │【若是设置后还不能上网，请选4关闭热点后再选3开启】│
echo   │                                                  │
echo   │                                                  │
echo   └—————————————————————————┘
echo.
echo 按任意键后，将返回主菜单...
pause>nul 2>nul
goto :mainmenu


:password
cls
echo   ┌—————————————————————————┐
echo   │                                                  │
echo   │            [修改WiFi热点密码页面]                │
echo   │                                                  │
echo   │   建议先在主界面，输入3选关闭WiFi热点，再修改    │
echo   │       输入新密码，按回车确认即可修改成功         │
echo   │                                                  │
echo   └—————————————————————————┘
set /p pwd=请输入您要设置的新密码[不少于8位]：

if exist %systemroot%\system\userinfo.txt (
for /f "tokens=1,2 delims= " %%i in (%systemroot%\system\userinfo.txt) do (set "username=%%i"))   &@rem 读取当前WiFi账户

netsh wlan set hostednetwork key=%pwd% >nul
if %errorlevel% == 0 (
echo   恭喜您，密码修改成功...
if exist %systemroot%\system\userinfo.txt (echo %username% %pwd%>%systemroot%\system\userinfo.txt)
) else (echo   密码修改失败，密码位数少于8位或其他原因！)
echo.
echo 按任意键后，将返回主菜单...
pause>nul 2>nul
goto :mainmenu


:note
cls
echo   ┌————————————————————————┐
echo   │                                                │
echo   │             [系统提示，进行检测]               │
echo   │                                                │
echo   │ Win7、Win8系统都行，其它用了也不会出现大问题   │
echo   │          下面检测网卡是否支持承载网络          │
echo   │                                                │
echo   └————————————————————————┘
echo.
netsh wlan show drivers|find "支持的承载网络  : 是">nul
if %errorlevel% == 0 ( echo          [检测发现网卡支持，放心的使用吧！]) else ( echo          [检测发现网卡可能不支持，不过可以试试。] )
echo.
echo 按任意键继续，返回程序主菜单...
pause>nul 2>nul
goto :mainmenu



:getinfo
@rem  获取连接到当前WIFI热点  客户端的IP和MAC地址等

@rem 开启变量延迟
setlocal enabledelayedexpansion    

@rem 获取连接到当前WIFI热点的客户端总数
for /f "skip=1 tokens=2 delims=:" %%i in ('netsh wlan show hostednetwork ^|find "客户端数"') do (set clientsum=%%i)


echo            [连接到本机WiFi热点的客户端总数为：!clientsum!]
echo.
set /a n=1
echo  编号   类型       MAC地址              IP地址


@rem 获取已通过身份验证的用户MAC地址
for /f "tokens=1,2 delims= " %%i in ('netsh wlan show hostednetwork ^| find "已经过身份验证"') do (
	set "clientmac=%%i"      
	@rem 把找出的mac地址的:号换成-号
	set  clientmac=!clientmac::=-!

	@rem 在arp缓存列表里通过MAC找出对应的IP
	for /f "tokens=1-3 delims= " %%a in ('arp -a^|find /i "!clientmac!"') do (
	set "clientip=%%a"
	set "clienttype=%%c" )
	echo  !n!      !clienttype!       !clientmac!    !clientip!
	set /a n=n+1
)
echo.  
echo 按任意键后，将返回主菜单...
pause>nul 2>nul
goto :mainmenu




:error
echo.
echo [您的选择不存在或者输入有误，按任意键返回...]
pause>nul 2>nul
goto :mainmenu


:unname
@rem 这个暂时未用到，有的系统CMD是英文内容，检测就要区分了，没必要。
echo.
echo [您还未开启WiFi热点，查看热点信息似乎没必要，按任意键返回主菜单...]
pause>nul 2>nul
goto :mainmenu


:quit
echo.
echo 感谢您的使用，按任意键退出程序...
pause>nul 2>nul
exit
