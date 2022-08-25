%% MATLAB FINAL by Cole Bardin      Section 61
%% Part A
%% Question 1
clc, clear, close all
a1=[6,-6,0;3,-3,0;1,-1,0]
a2=[-2,6,9;-2,5,6;0,0,1]
a3=[-2,6,14;-2,5,8;0,0,3]
a4=[-4,10,15;-3,7,8;0,0,3]

eig(a1)
eig(a2)
eig(a3)
eig(a4)
%% Question 2
clc, clear, close all
A=[-24,16,-16;-40,28,-28;-4,4,-4]
eig(A)
rref([A,[0;0;0]])
v1=[0;1;1]

rref([A,v1])
%% Question 3
clc, clear, close all
syms y(t);
y0=0;yp0=1;
dy=diff(y,t); d2y=diff(y,t,t);
DE = d2y+y
Fa = t
Fb = -2*sin(t)
Fc = 2*cos(t)
Fd = sin(t)

simplify(dsolve(DE==Fa,y(0)==y0,dy(0)==yp0))
simplify(dsolve(DE==Fb,y(0)==y0,dy(0)==yp0))
simplify(dsolve(DE==Fc,y(0)==y0,dy(0)==yp0))
simplify(dsolve(DE==Fd,y(0)==y0,dy(0)==yp0))
%% Question 4
clc, clear, close all
syms s;
Fs = (3125*s)/( (s-2)*(s-2)*(s-2)*(s+3)*(s+3)*(s+3) )
PF = partfrac(Fs)
%% Question 5
clc, clear, close all
syms y(x);
y0=0;dy0=0;
dy=diff(y,x); d2y=diff(y,x,x);
DEa = d2y + 3*dy + 2*y == exp(-1*x)
DEb = d2y + 4*dy + 3*y == 4*x*exp(-1*x)
DEc = d2y + dy == x*exp(-1*x)
DEd = d2y + 3*dy + 2*y == 2*(1+x)*exp(-1*x)

simplify(dsolve(DEa,y(0)==y0,dy(0)==dy0))
simplify(dsolve(DEb,y(0)==y0,dy(0)==dy0))
simplify(dsolve(DEc,y(0)==y0,dy(0)==dy0))
simplify(dsolve(DEd,y(0)==y0,dy(0)==dy0))
%% Part B
%% Questions 3-5
clc, clear, close all
syms x(t) y(t);
xm=[x;y];
x0=[-0.28;0.00];
time = 00;001;8;


%% Part C
%% Points 1-10
clc, clear, close all
syms Y t s;
y0=-60;dy0=0;
f=12+12*sin(t)

% Point 1
F=laplace(f)

d2Y = s*s*Y-s*y0-dy0
dY = (1/6)*(s*Y - y0)
LTofDE = d2Y + dY + Y == F
Sol = solve(LTofDE, Y)
Y = matlabFunction(Sol); 
% Point 2
Y(s);
% Point 3
PF = partfrac(Y(s))
% Point 4
limit(Y(s),s,inf)
% Point 5
y=ilaplace(Y(s))
% Point 6
dy = matlabFunction(simplify(diff(y,t)))
y=matlabFunction(y)
% Points 7-8
time=[0:0.01:2*pi];

grid on
hold on
limit = plot(y(time), dy(time), 'r--', "LineWidth",3);
center = plot(12,0, 'bo', "MarkerFaceColor",'g');
axis equal
axis([-100, 120, -100, 120])
xlabel("y(t)");
ylabel("dy/dt");
title("Limit cycle");

%% Points 9-10
clc, clear, close all
syms x(t) y(t);
xm=[x;y];
x0=[-0.28;0.00];
time = [0,8];
sol = ode45(@diffeq65,time,x0)
hold on
plot(sol.x, sol.y, 'b')
plot(-0.28, 0, "bh", "MarkerSize",10,"MarkerFaceColor",'y');
title("Rose of Venus")
%% Part C
%% Points 1-10
clc, clear, close all
syms Y t s;
y0=-60;dy0=0;
f=12+12*sin(t)

% Point 1
F=laplace(f)

d2Y = s*s*Y-s*y0-dy0
dY = (1/6)*(s*Y - y0)
LTofDE = d2Y + dY + Y == F
Sol = solve(LTofDE, Y)
Y = matlabFunction(Sol); 
% Point 2
Y(s);
% Point 3
PF = partfrac(Y(s))
% Point 4
limit(Y(s),s,inf)
% Point 5
y=ilaplace(Y(s))
% Point 6
dy = matlabFunction(simplify(diff(y,t)))
y=matlabFunction(y)
% Points 7-8
time=[0:0.05:2*pi];
grid on
hold on
limit = plot(y(time), dy(time), 'r.', "LineWidth",3);
center = plot(12,0, 'bo', "MarkerFaceColor",'g', "MarkerSize",10);
axis equal
axis([-100, 120, -100, 120])
xlabel("y(t)");
ylabel("dy/dt");
title("Limit Cycle")

% Points 9-10
clear
grid off
syms Y t s;
y0=0;dy0=0;
f=12+12*sin(t)

F=laplace(f)
d2Y = s*s*Y-s*y0-dy0
dY = (1/6)*(s*Y - y0)
LTofDE = d2Y + dY + Y == F
Sol = solve(LTofDE, Y)
Y = matlabFunction(Sol); 
Y(s);
PF = partfrac(Y(s))
limit(Y(s),s,inf)
y=ilaplace(Y(s))
dy = matlabFunction(simplify(diff(y,t)))
y=matlabFunction(y)
time=[0:0.01:15*pi];
rel = plot(y(time), dy(time),'b', "LineWidth",3);
ip = plot(0,0, 'bh', "MarkerFaceColor",'y', "MarkerSize",10);

legend(["Limiting Cycle","Center Point","Relaxed Solution","Initial Point"],"Location","north");
%% Part D
% Points 1-5
clc, clear, close all
syms s t;
Re = 1.00; Rv = 0.72;       % in astronomical units
we = 2*pi; wv = 2*pi *13/8; % angular frequencies for Earth and Venus
c = (wv - we) * Rv % 2.8274

A=[0,-2*pi;2*pi,0];
f=c*[-1*sin(wv*t);cos(wv*t)];
x0=[-0.28;0.00];

% Point 1
R = inv(s*eye(2)-A)
% Point 2
F = laplace(f)
% Point 3
xzi = R*x0
% Point 4
xzs = simplify(R*F)
% Point 5
X=xzi+xzs
x=matlabFunction(ilaplace(X))
x(4)