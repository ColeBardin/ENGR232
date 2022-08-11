%% Lab 8 by Cole Bardin 		Section 61
%% Water Clocks: The Polyvascular Clepsydra and the Laplace Transform
%% Questions 1-2
clc, clear, close all

% Question 1
syms s t Y
y0 = 1 % initial condition
Y1 = s*Y - y0 % transform of the derivative

LTofDE = Y1 == -1*Y
Sol = solve(LTofDE, Y)
Y = matlabFunction(Sol); Y(s);
Y = partfrac(Y(s)) % express solution in partial fraction form
sol = ilaplace(Sol,s,t);
y = matlabFunction(sol); y(t)
% Question 2
H = matlabFunction(1-y(t)); H(1)

time=0:0.1:3;
hold on
grid on
plot(time, y(time), 'r--', "LineWidth",3);
plot(time, 1-y(time), 'b.-', "LineWidth",3)
plot(time, time, 'k--', "LineWidth",3)
plot(1, H(1), 'bo', "MarkerFaceColor", 'g', "MarkerSize",10)
%% Questions 5-8
clc, clear, close all

% Question 5
syms y1(t) y2(t) f1(t) f2(t) F(s);
x = [y1; y2];
A= [-1, 0; 1, -1]; x0 = [1;1];
DE = diff(x,t) == A*x

sol = dsolve(DE, x(0)==x0)

% Question 6
f1 = int(sol.y1, 0, t)
f2 = simplify(int(sol.y2, 0, t))

% Question 7
XL = inv((s*eye(2) - A))*x0
xl = ilaplace(XL)

% Question 8
syms s
A=[-1 0; 1 -1] % system matrix
x0 = [1;1] % initial conditions
X =  inv((s*eye(2) - A))*x0 % find X here using inv()
F = X / s % find F here. Integration is division by s.
f = ilaplace(F) % find f here using ilaplace. 

%% Question 9
clc, clear, close all
syms s;

A = [-1, 0, 0, 0; 1, -1, 0, 0; 0, 1, -1, 0; 0, 0, 1, -1]
x0= [1;1;1;1]

X = inv(s*eye(4) - A) * x0
F = X/s
f = ilaplace(F) % Cumulative outflows in the time domain
f = matlabFunction(f) % convert f to a function

time = 0:0.1:10;
Y = f(time);

grid on
hold on
axis([0, 10, 0, 10])
set(gca, "FontSize", 15)
ideal = plot(time, time, 'k--', "LineWidth",2);
y1 = plot(time, Y(1,:), "LineWidth", 3);
y2 = plot(time, Y(2,:), "LineWidth", 3);
y3 = plot(time, Y(3,:), "LineWidth", 3);
y4 = plot(time, Y(4,:), "LineWidth", 3);
xlabel("Time")
ylabel("Cumulative Outflows")
legend([ideal, y1], ["Ideal Water Clock", "Cumulative Outflows for each of the four vessels"], "Location","NorthWest")

f_of_1 = f(1)
%% Question 10
clc, clear, close all

syms s;

N = 12 % Number of vessels, excluding the collection chamber
subdiagonal = 1; diagonal = -1; superdiagonal = 0
A = full(gallery('tridiag', N, subdiagonal, diagonal, superdiagonal))
x0 = ones(N,1) % Initial conditions

X = inv(s*eye(N) - A) * x0
F = X/s
f = ilaplace(F) % Cumulative outflows in the time domain
f = matlabFunction(f) % convert f to a function

time = 0:0.1:10;
Y = f(time);

grid on
hold on
axis([0, 10, 0, 10])
set(gca, "FontSize", 15)
ideal = plot(time, time, 'k--', "LineWidth",2);
for i=1:12
    yh = plot(time, Y(i,:), "LineWidth", 3);
end
xlabel("Time")
ylabel("Cumulative Outflows")
legend([ideal, yh], ["Ideal Water Clock", "Cumulative Outflows for each of the four vessels"], "Location","NorthWest")

f_of_1 = f(1)