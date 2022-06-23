%% MATLAB Notes
%% 3/30/2022

basic variables and arithmetic operations


endling statement with ; stops result from appearing in Command Window
but it is still visible in Workspace
x=5*3;

variable must start with letter and can contain letters, numbers underscores


save command:
save filename.mat
	saves data from workspace to file
save particular var: save filename.mat var_name

laod command:
load filename.mat
	loads data from file to workspace
load particular var: load filename.mat var_name

"clear" command clears the Workspace
clc, clear, close all % Good usage at beginning of each section

entering variables name from workspace displays contents


clc command clears the Command Window


When MATLAB is closed, workspace is cleared!



Predefined values:
pi
trig funcs
sqrt() (automatically converts to imaginary numbers if needed)


Format calls:
>> format long
>> format short

long displays 15 decimal places
short displays 4 decimals



Arrays:
y = [4 5]
optional comma between elements in arr

add item to col:
[5;6] is a a col 2 row array

row vector: arr with elements separated by space
col vector: arr with elements separatred by ;

array of range:
: operator is INCLUSIVE on both ends
y = 5:8
y = 5 6 7 8

optional middle argument to specify step
y = 20:2:26
y = 20 22 24 26


linspace() command: same as other programming languages
linspace(first, last, num_of_elements)
first and last are INCLUSIVE


Transpose operator: '
linspace and : operators make row vectors

adding ' operator makes it a col vector
can be done to variables and :/linspace calls if isolated
b=b'
b = (1:2:5)'


Random numbers
nubers between 0-1
rand(n) -> nxn array of random numbers

rand(r,c) -> rxc array of random numbers


ones() zeros() same r,c/n format as random but fills with ones or zeroes

size(x) returns r,c for given matrix x


Indexing arrays:
INDICES BEGIN AT 1!!!!!!!!!!!!!!
: for all
uses() for accessing
x(5)
x(row,col)

end keyword to get last index (+-*/ etc onto)
using single num for indexing matrix will go down each col in order!!


Arithmetic operations on arrays:
x + or - # 
x * or / # 

sqrt(x)
round(x)


min(x) and max(x) do exactly what you think they do
retrn just max but can be used to extract index of max
[xMax, idx] = max(x)

MULTIPLYING TWO MATRICES:
z = [3,5] .* [4,12]
standalone * operator is wrong dimension


size(x) returns rows, cols
[xrow,xcol] = size(x) // creates two variables for the two return values

using ~ can ignore first output if only second is needed to reduce memory
[~,col] = size(x)


Norm function:
int norm(matrix, type);
A = [1,2,3;4,5,6;7,8,9];
two_norm = norm(A) % Default 2
one_norm = norm(A,1) % Use 1 norm




%% Plotting:
plot(x,y,format) func takes two arrays
format simimar to matplotlib in python
"r--o"
red dashed lines with o markers

hold on 
hold off

plot(y) gives 1-n x values for plot

Adjust linewidth:
plot(y, "LineWidth",5) %  yes they're two arguments...
can be "" or ''

fill(x,y,c) to fill x,y graph points with color c
can also give colormap inputs
No need to tell x(end) to go back to x(1) since fill command will close shape

%% Plot Formatting:
% Title and background formatting
title('title')
ylabel('ylabel')
xlabel('xlabel')
legend('line1','line2','Location','north')
axis([xmin, xmax, ymin, ymax])
xticks(min:step:max)
yticks(min:step:max)

% Plot Object Formatting:
PLOTTING marker options:
'o'     Open circle
'+'     Plus sign
'*'     Asterisk
'.'     Point
'x'     Cross
'_'     Horizontal Line
'|'     Vertical Line
's'     Square
'd'     Diamond
'^'     Upward Triangle
'v'     Downward Triangle
'>'     Right Triangle
'<'     Left Triangle
'p'     Pentagram
'h'     Hexagram
'none'  No Marker
Marker Style Parameters:
'Marker'			marker style
'MarkerIndices'		int/ints	displays circle marker at given indices
'MarkerSize'		int
'MarkerEdgeColor'	color
'MarkerFaceColor'	color

Line Style:
'-'		Solid Line (default)
'--'	Dashed Line
':'		Dotted Line
'-.'	Dash-Dotted Line
'none'	No Line
Line Style Parameters:
'Color'			color
'LineStyle'		line style (Above)
'LineWidth'		int


% Figure
fig = figure()
	% Useful for multiple plots in same program. need more notes

%% Subplots
subplot(m,n,p) % m num rows, n is num cols, p is position index. similar to matplotlib
call subplot(m,n,p) before calling plot func to change which subplot is being operated on

% Spanning:
subplot(2,2,1) % upper left
plot()...
subplot(2,2,2) % upper right
plot()...
subplot(2,2,[3,4]) % bottom two

% Subplot handles
ax = subplot(2,2,1)
allows for axis formatting:
ax.FontSize = 15;
ax.LineWidth = 2;

% Replace subplot index with empty index
subplot(2,2,2, 'replace') % replaces subplot with index 2 of a 2x2 grid with an empty plot

% Custom positions for subplots:
pos1 = [0.1 0.3 0.3 0.3]
subplot('position', pos1)
plot()...
pos2 = [0.5 0.15 0.4 0.7]
subpolot('position', pos2)
plot()...

% Polar axis subplot
ax = subplot(2,1,1,polaraxes);
polarplot(ax,theta, rho)







%% Tables
Tables can hold columns of different data types
accessing table data:
table_name.data_col_name

table.col = x.*y if col does not exist, it will be created

sorting tables:
elements = sortrows(elements, 'Mass') or to switch order:
elements = sortrows(elements,'Mass','descend')



Relationship operators:
or Comparrison operators
< > == ~=
return 1 or 0

can be applied to whole arrays
[5 10 15] > 12
ans = 
    0    0    1
returns LOGICAL array

this allows to be indexed and return values of array for corresponding 1 vals
v = v1(v1 > 6)
v =
    6.6678
    9.0698

Logical indexing to reassign values in an array
x(x==99) = 1 % Reassignes all values of 99 to 1 in x array

Logical expressions can be mixed with & and | for further logic


if statements:

if CONDITION
	STATEMENT
elseif CONDITION
	STATEMENT
else
	STATEMENT
end

must contain 'end' keyword


loops:
for x = 1:5
	xsq = x ^2
end
disp('done!')



rref()
isequal(A, B)
trace()
eye()
det()
rng()
randi()
abs()
null()

DEF: Commute
when AB=BA or AB-BA=0

Declaring symbols:
REQUIRES SYMBOLIC MATH TOOLBOX
syms a b c d


Trace of matrix
trace(A)


Identity matrix:
eye(n) or eye(r,c)
eye(2) = [1, 0; 0, 1]

trace(eye(n)) = n


Trig funcs
cos(theta)
sing(theta)
IN RADIAN

for Degrees
dcos(deg)
dsing(deg)

user_input = input(msg) func
gets input from user, displays msg string
just like python



%% Declaring funcs:

% full function. must be at bottom of document:
function ret_obj = funcname(param1, param2);
ret_obj = [1,0,param1;0,1,param2;0,0,1];


Calling func:
trans_mat_1_2 = funcname(1,2);




Anonymous Functions:
% Must be declared ABOVE call
F = @(x,y) [x;y];

Calling func:
b = F(1,2) % returns [1,2] into b array varaible
