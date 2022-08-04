%% Lab 7 by Cole Bardin 		Section 61
%% Laplace Workshop
%% Part A: Definition of the Laplace Transform
%% 1a
clc, clear, close all
syms s t; assume(real(s)>0)
f = t;
L = int( exp(-s*t) * f, 0, inf)
assume(s,'clear') 
%% 1b
clc, clear, close all
syms s t; assume(real(s)>0)
f = t^2;
L = int( exp(-s*t) * f, 0, inf)
assume(s,'clear') 
%% 1c
clc, clear, close all
syms s t; assume(real(s)>5)
f = 3*exp(5*t);
L = simplify(int( exp(-s*t) * f, 0, inf))
assume(s,'clear') 
%% 2a
clc, clear, close all
syms n s t; assume(real(s)>0)
f = t^n;
L = simplify(int( exp(-s*t) * f, 0, inf))
assume(s,'clear') 
%% 2b
clc, clear, close all
syms a s t; assume(s>0); assume(a,'real')
f = sin(a*t);
L = int( exp(-s*t) * f, 0, inf)
assume(s,'clear')
%% 2c
clc, clear, close all
syms a s t; assume(s>a)
f = exp(a*t);
L = int( exp(-s*t) * f, 0, inf)
assume(s,'clear')
%% 3a
clc, clear, close all
syms t;
laplace(3*cosh(5*t))
%% 3b
clc, clear, close all
syms t;
u = @ (t) heaviside(t);
laplace((t-3)^2 * u(t-3))
%% 3c
clc, clear, close all
syms t;
laplace(t^(0.5))
%% 4a
clc, clear, close all
syms t;
assume(t>0)
ilaplace(sym(1))
%% 4b
clc, clear, close all
syms s;
ilaplace( (5*s+8)/(16+s^2) )
%% 4c
clc, clear, close all
syms s;
ilaplace( 1/(s^(3/2)) )
%% Part B: Partial fraction expansions
%% 5a
clc, clear, close all
syms s;
partfrac( 16/(s^2-8*s))
%% 5b
clc, clear, close all
syms s;
partfrac( (9*s^2 - 52*s +72)/((s-2)*(s-3)*(s-4)) )
%% 5c
clc, clear, close all
syms s;
partfrac( (3*s^2 - 14*s + 20)/((s-3)^3) )
%% Part C: Solving a Differential Equation using the Laplace Transform
clc, clear, close all
% Question 6
syms y(t);
dy = diff(y,t);
d2y = diff(y,t,t);
DE = d2y + y == 6*sin(2*t);
sol = dsolve(DE, y(0)==0, dy(0)==6)
Y = matlabFunction(sol);

% Question 7: Laplace Transform Method for Solution
% a. Define the necessary symbolic variables.
fprintf("Question 7: Solve a DE using the Laplace Transform\n")
syms s t Y % Now Y(s) denotes the transform of the unknown function y(t).
% b. Find the Laplace transform of y'(t): Y1 = s Y - y(0)
% This is necessary, even though this term does not appear in the LHS
% of the differential equation.
y0 = 0; dy0 = 6; % Initial conditions
f = 6 * sin(2*t) % the forcing function
disp 'The transform of the derivative is:'
Y1 = s*Y - y0 % Add the initial value y(0)=y0 manually here.
% c. Find the Laplace transform of y''(t): Y2 = s Y1 - y'(0)
disp 'The transform of the double derivative is:'
Y2 = s*Y1 - dy0 % Add the initial value y'(0)=dy0 manually here.
% d. Find the Laplace transform F of the forcing term f(t) = 6*sin(2*t)
disp 'The transform F(s) of the forcing term f(t) is:'
F = laplace( f )
% e. Combine all the terms into the transform of the entire equation,
% which we will name LTofDE for Laplace Transform of DE.
% y'' + y = f(t) with the initial conditions y(0)=y0, y'(0)=dy0
LTofDE = Y2 + Y == F
% f. Use solve to solve this algebraic equation for the unknown Y.
Sol = solve(LTofDE, Y);
Y = matlabFunction(Sol); Y(s)
Y = partfrac(Y(s)) % express solution in partial fraction form
% g. Find the inverse Laplace transform of the solution:
sol = ilaplace(Sol,s,t);
y = matlabFunction(sol); y(t) % solution in the time domain
%% Part D: Solve a new DE using the Laplace transform technique
clc, clear, close all
% a. Define the necessary symbolic variables.
fprintf("Question 8: Solve a DE using the Laplace Transform\n")
syms s t Y % Now Y(s) denotes the transform of the unknown function y(t).
% b. Find the Laplace transform of y'(t): Y1 = s Y - y(0)
% This is necessary, even though this term does not appear in the LHS
% of the differential equation.
y0 = 4; dy0 = 2; % Initial conditions
f = 13*exp(-2*t) % the forcing function
disp 'The transform of the derivative is:'
Y1 = s*Y - y0 % Add the initial value y(0)=y0 manually here.
% c. Find the Laplace transform of y''(t): Y2 = s Y1 - y'(0)
disp 'The transform of the double derivative is:'
Y2 = s*Y1 - dy0 % Add the initial value y'(0)=dy0 manually here.
% d. Find the Laplace transform F of the forcing term f(t) = 6*sin(2*t)
disp 'The transform F(s) of the forcing term f(t) is:'
F = laplace( f )
% e. Combine all the terms into the transform of the entire equation,
% which we will name LTofDE for Laplace Transform of DE.
% y'' + y = f(t) with the initial conditions y(0)=y0, y'(0)=dy0
LTofDE = Y2 + Y1 + (5/4)*Y == F
% f. Use solve to solve this algebraic equation for the unknown Y.
Sol = solve(LTofDE, Y);
Y = matlabFunction(Sol); 
simplifyFraction(Y(s))
Y = partfrac(simplifyFraction(Y(s))) % express solution in partial fraction form
% g. Find the inverse Laplace transform of the solution:
sol = ilaplace(Sol,s,t);
y = matlabFunction(sol); y(t) % solution in the time domain