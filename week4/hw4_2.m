%% 5
clc, clear, close all
syms v(t) x(t);

m=80;
fb=1/40;
b=10;
vtarget=40;

DEv = diff(v,t) == 9.81*(1-fb) - (b/m)*v;
vt = dsolve(DEv,v(0)==0)
DEx = diff(x,t) == vt;
xt = dsolve(DEx,x(0)==0)

time = eval(solve(vt==vtarget,t))