@echo off

md d:\fly >nul 2>nul

set a=c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z

for %%a in (%a%) do subst %%a: d:\fly >nul 2>nul

exit