%% 5
clc, clear, close all
format long

n = 10;
h=0.1;
y = double(zeros(1,n+1));
x = double(zeros(1,n+1));
yp =@(x,y)(1/x)^2 - y/x - y^2;
yf =@(x) -1/x;
yg = double(zeros(1,n+1));

x(1)=2;
y(1)=-0.5;

for i=2:n+1
    x(i) = x(i-1) + h;
    y(i) = y(i-1) + h*yp(x(i-1), y(i-1));
    yg(i) = yf(x(i));
end
x
y

hold on
grid on
plot(x,y, 'r')
plot(x,yg, 'b')
axis tight
%% 8
clc, clear, close all
format default
syms v(t) x(t);
m = 90;
h=1000;
b1=30;
b2=90;
vopen=25;

DEc = diff(v,t) == 9.81 - (b1/m)*v;
vc = dsolve(DEc,v(0)==0);
DEc = diff(x,t) == vc;
xc = dsolve(DEc,x(0)==0)
xclose = matlabFunction(xc)
t1 = eval(solve(vc==vopen,t))
ho = h-xclose(t1)

DEo = diff(v,t) == 9.81 - (b2/m)*v;
vo = dsolve(DEo,v(0)==vopen);
DEo = diff(x,t) == vo;
xo = dsolve(DEo,x(0)==0)
xopen = matlabFunction(xo)
t2 = eval(solve(xo==ho,t))

total = t1+t2

%% 9
clc, clear, close all
syms v(t) x(t);

m=80;
fb=1/40;
b=10;
vtarget=60;

DEv = diff(v,t) == 9.81*(1-fb) - (b/m)*v;
vt = dsolve(DEv,v(0)==0)
DEx = diff(x,t) == vt;
xt = dsolve(DEx,x(0)==0)

time = eval(solve(vt==vtarget,t))

%% 10
clc, clear, close all
syms v(t) x(t);

m=6;
v0=800;
b=0.1;

DE = diff(v,t) == -9.81-(b/m)*v*v;
vt = dsolve(DE,v(0)==v0)
tmaxh = eval(solve(vt==0,t))
DE = diff(x,t) == vt;
xt = dsolve(DE,x(0)==0)
x = matlabFunction(xt)
hmax = round(x(tmaxh))

%% 14
clc, clear, close all
syms yv xv;

h=0.25;
y0=2;
n=3;
ye=zeros(1,n);
x=zeros(1,n);
y=zeros(1,n);
yf = matlabFunction(2*exp(-2*xv))
yp = matlabFunction(-2*yv)

y(1)=2;
ye(1)=2;
x(1)=0;

for i = 2:n
    x(i)=x(i-1)+h;
    kn1=yp(ye(i-1));
    kn2=yp(ye(i-1)+0.5*h*kn1);
    kn3=yp(ye(i-1)+0.5*h*kn2);
    kn4=yp(ye(i-1)+h*kn3);
    ye(i)=ye(i-1)+(h/6)*(kn1+2*kn2+2*kn3+kn4);
    y(i) = yf(x(i) );
end
x
ye
y

%% 18
clc, clear, close all

syms y(x);
DE = diff(y,x) == exp(-1*x)-2*y;
y = dsolve(DE,y(0)==2)

%% 19
clc, clear, close all

syms x(t);
DE = t*t*diff(x,t)==t*t*t*log(t)+1-2*t*x;
x = dsolve(DE, x(1)==0)

%% 20
clc, clear, close all

syms y(t);
DE = diff(y,t) == 60*exp(-20*t)-6*y;
y = dsolve(DE, y(0)==25)