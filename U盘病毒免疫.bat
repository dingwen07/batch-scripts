@echo off
set /p disk=请输入要执行的盘符：
mkdir %disk%\autorun.inf
mkdir %disk%\autorun.inf\.\autorun...\\
ATTRIB +A +S +H +R %disk%\autorun.inf