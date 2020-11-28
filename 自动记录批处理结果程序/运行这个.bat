@echo off
del part1.txt
del part2.txt
cls
echo 请等待批处理执行完毕
echo 你可以在程序退出后删除"part1.txt"，也可以不删
echo %computername%\%username%>>part1.txt
echo Start time:%date% %time%>>part1.txt
copy log.txt part2.txt>nul
bat.bat>>part1.txt
del part1.txt