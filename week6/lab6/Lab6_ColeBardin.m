%% Lab 6 by Cole Bardin 	Section 61
%% Laplace Workshop
%% Question 1.2
clc, clear
AM = [1,1,0,-3;0,4,1,-14;4,0,4,32]
rref(AM)

%% Question 1.4
clc, clear
AM = [1,1,0,0;4,7,1,0;4,10,5,90]
rref(AM)

%% Question 1.7
clc, clear
AM = [1,1,1,1;6,2,4,7;8,0,0,5]
rref(sym(AM))

%% Question 1.8
clc, clear
AM = [1,1,1,0;5,7,8,0;6,10,15,5]
rref(sym(AM))

%% Question 1.9
clc, clear
AM = [1,0,1,1;6,1,0,0;0,6,0,1]
rref(sym(AM))