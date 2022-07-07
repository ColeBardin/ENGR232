function xdot = smd(t,x) % Note, x will be a column vector.
    m=9; b=12; k=229;
    f=0;
    A = [0,1; -(k/m), -(b/m)];
    b=[0;1];
    % The last two lines will be:
    xdot = A*x + b*f/m;
end