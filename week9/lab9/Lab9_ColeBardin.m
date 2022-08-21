%% Lab 9 by Cole Bardin 		Section 61
%% Matrix Laplace Method and Linear Systems
%% Part A: The Harmonic Oscillator
clc, clear, close all
syms s;
A = [0, 1; -1, 0]; x0 = [3;4];
% a
Rs = inv(s*eye(2)-A)
% b
Ts = ilaplace(Rs)
% c
x = Ts*x0

% d. Plot the solution x2 (vertical axis) versus x1
x1 = matlabFunction(x(1))
x2 = matlabFunction(x(2))
time = 0:0.01: 2*pi;

% e
grid on; hold on
set(gca,'FontSize', 20)
plot(x1(time), x2(time), 'r', "LineWidth", 3)
xlabel("X1")
ylabel("X2")
title("X1 vs X2 Phase Plot")
%% Part B: Falling Apple, Nonhomogeneous Equation (No friction)
clc, clear, close all
syms s h v0 g t;
A = [0,1;0,0]; x0 = [h;v0];
% a
R = inv(s*eye(2)-A)
% b
T = ilaplace(R)
% c
f = sym([0;-g]);
F=laplace(f,t,s)
% d
xzi = T*x0
% e
xzs = ilaplace(R*F)
% f
x = xzi + xzs
%% Part C: Two Tanks – Laplace Matrix Method
clc, clear, close all
syms s t k;
A = (1/12)*[-4,1;4,-4]; 
q0=[2;4]; 
b = [6*k;0];
B = laplace(b, t, s)

% a
R = inv(s*eye(2)-A)

% b
T = ilaplace(R)

% c
qzi = T*q0

% d
qzs = ilaplace(R*B)

% e
x = qzi + qzs
%% Part D: The Rose of Venus
clc, clear, close all
syms s t c wv we;
%we=2*pi; wv=2*pi*(18/3);
Re=1; Rv=0.72;
A = [0, -2*pi;2*pi, 0]; x0=[-0.28;0.00];
%c=(wv-we)*Rv;
f=c*[-sin(wv*t);cos(wv*t)];
xe=[cos(we*t);sin(we*t)];
xv=[cos(wv*t);sin(wv*t)];
z=xv-xe;
% a
R=inv(s*eye(2)-A)
% b
F = laplace(f,t,s)
% c
xzi=R*x0
% d
xzs=R*F
% e
x = matlabFunction(simplify(ilaplace(xzi+xzs)))
x(2.8274,4,2*pi*(18/3))