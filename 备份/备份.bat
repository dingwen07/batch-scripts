@echo off


:backup
cls

Echo					文件备份工具
Echo.
Echo.
Echo				本程序可帮助您备份/恢复文件
Echo			      只能备份/还原当前用户创建的文件	
pause
set /p disk=请输入您想要/已经保存备份文件的磁盘卷标(例如 H)：
cls
set fpath=%disk%:\backup\%username%
if exist %fpath% goto hvf
goto nhvf

:hvf
ATTRIB +A +S +H +R     %disk%:\backup
cls
Echo					文件备份工具
Echo				本程序可帮助您备份/恢复文件
Echo.
Echo		[1] 备份
Echo		[2] 恢复
Echo		[3] 数据管理
Echo		[0] 退出
Echo.

Set /p choose1=	请输入您的选择:
If "%choose1%"=="1" Goto backup
If "%choose1%"=="2" Goto recover
If "%choose1%"=="3" Goto manage
If "%choosel%"=="0" Exit
echo 请重新选择!
pause
goto hvf

:nhvf
mkdir %fpath%>nul
ATTRIB +A +S +H +R     %disk%:/backup
cls
Echo					文件备份工具
Echo				本程序可帮助您备份/恢复文件
Echo.
Echo		[1] 备份
Echo		[0] 退出
Echo.

Set /p choose1=	请输入您的选择:
If %choose1%==1 Goto backup
If %choosel%==0 Exit
echo 请重新选择!
pause
goto nhvf








:backup
cls
Echo		[0] 备份以下全部
Echo		[1] 备份桌面
Echo		[2] 备份我的文档
Echo		[3] 备份视频
Echo		[4] 备份图片
Echo		[5] 备份下载
Set /p choose2=	请输入您的选择:
If "%choose2%"=="0" Goto ball
If "%choose2%"=="1" Goto bdesktop
If "%choose2%"=="2" Goto bdocuments
If "%choose2%"=="3" Goto bvideos
If "%choose2%"=="4" Goto bpictures
If "%choose2%"=="5" Goto bdownloads
Exit

:ball
md %fpath%\Desktop
xcopy /e /y  c:\Users\%username%\Desktop %fpath%\Desktop\

md %fpath%\Documents
xcopy /e /y  c:\Users\%username%\Documents %fpath%\Documents\

md %fpath%\Videos
xcopy /e /y  c:\Users\%username%\Videos %fpath%\Videos\

md %fpath%\Pictures
xcopy /e /y  c:\Users\%username%\Pictures %fpath%\Pictures\


md %fpath%\Downloads
xcopy /e /y  c:\Users\%username%\Downloads %fpath%\Downloads\

pause
Goto backup

:recover
cls
Echo		[0] 恢复以下全部
Echo		[1] 恢复桌面
Echo		[2] 恢复我的文档
Echo		[3] 恢复视频
Echo		[4] 恢复图片
Echo		[5] 恢复下载
Set /p choose3=	请输入您的选择:
If "%choose3%"=="0" Goto rall
If "%choose3%"=="1" Goto rdesktop
If "%choose3%"=="2" Goto rdocuments
If "%choose3%"=="3" Goto rvideos
If "%choose3%"=="4" Goto rpictures
If "%choose3%"=="5" Goto rdownloads
Exit

:rall
xcopy /e /y  %fpath%\Desktop c:\Users\%username%\Desktop\
xcopy /e /y  %fpath%\Documents c:\Users\%username%\Documents\
xcopy /e /y  %fpath%\Videos c:\Users\%username%\Videos\
xcopy /e /y  %fpath%\Pictures c:\Users\%username%\Pictures\
xcopy /e /y  %fpath%\Downloads c:\Users\%username%\Downloads\
pause
Goto backup

:bdesktop
md %fpath%\Desktop
xcopy /e /y c:\Users\%username%\Desktop %fpath%\Desktop\
pause
Goto backup




:bdocuments
md %fpath%\Documents
xcopy /e /y c:\Users\%username%\Documents %fpath%\Documents\
pause
Goto backup



:bvideos
md %fpath%\Videos
xcopy /e /y c:\Users\%username%\Videos %fpath%\Videos\
pause
Goto backup


:bpictures
md %fpath%\Pictures
xcopy /e /y c:\Users\%username%\Pictures %fpath%\Pictures\
pause
Goto backup


:bdownloads
md %fpath%\Downloads
xcopy /e /y c:\Users\%username%\Downloads %fpath%\Downloads\
pause
Goto backup




:rdesktop
xcopy /e /y %fpath%\Desktop c:\Users\%username%\Desktop\
pause
Goto backup


:rdocuments
xcopy /e /y %fpath%\Documents c:\Users\%username%\Documents\
pause
Goto backup


:rvideos
xcopy /e /y %fpath%\Videos c:\Users\%username%\Videos\
pause
Goto backup


:rpictures
xcopy /e /y %fpath%\Pictures c:\Users\%username%\Pictures\
pause
Goto backup


:rdownloads
xcopy /e /y %fpath%\Downloads c:\Users\%username%\Downloads\
pause
Goto backup

:manage
