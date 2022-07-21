%% Online Exam 2
%% Question 
clc, clear, close all
syms y(t);

dy = diff(y,t);
d2y = diff(dy, t);
d3y = diff(d2y, t);

DE = d3y -12*d2y + 56*dy -120*y == 0;

sol = dsolve(DE, y(0)==1, dy(0)==0, d2y(0)==0)