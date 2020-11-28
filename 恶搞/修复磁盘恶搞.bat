@echo off
set /p disk=请输入您要修复恶搞磁盘卷标：
Echo 确定要修复恶搞？这将会毁掉所有根目录下的文件，请在修复前把重要文件放进子文件夹里！
pause>nul

Echo 第一次 确定要修复？
pause>nul

Echo 第二次 确定要修复？
pause>nul

Echo 第三次 确定要修复？
pause>nul

Echo 第四次 确定要修复？
pause>nul

Echo 第五次 确定要修复？
pause>nul

del %disk%:\*.*
cls
Echo		修复恶搞完毕，任意键退出……
pause>nul