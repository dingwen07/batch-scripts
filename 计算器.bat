@echo off 
color a 
:Calc 
set /p input=请输入表达式： 
set /a result=%input% 
echo 计算结果为：%input%=%result% 
goto Calc 