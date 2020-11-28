@echo off
set /p ip=要PING的主机地址：
ping -t -l 65500 %ip%