
@echo off
title 对话框制作
( 
set /p 对话框标题="请输入你的对话框的标题>"
cls
set /p 对话框内容="请输入你的对话框的内容>"
cls
echo 对话框类型：
echo 0=无图标
echo 16=错误
echo 32=疑问
echo 48=警告
echo 64=提示
set /p A="请输入对话框类型>"
cls
echo 对话框按钮：
echo 0=确定
echo 1=确定 取消
echo 2=终止 重试 取消
echo 3=是 否 取消
echo 4=是 否
echo 5=重试 取消
echo 6=呵呵
set /p B="请输入对话框按钮>"
set /a 答案=A+B
 )
echo msgbox "%对话框内容%","%答案%","%对话框标题%" > %TEMP%\TEMP.VBS
cls
echo 对话框制作完成！请截图。截好了关闭对话框以退出。
start /wait %TEMP%\TEMP.VBS
del %TEMP%\TEMP.VBS 