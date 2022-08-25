function xdot = diffeq65(t,x)
% Part B Questions 1-2
    % Earth-Venus Orbital Resonance - the Rose of Venus
    Re = 1.00; Rv = 0.72;       % in astronomical units
    we = 2*pi; wv = 2*pi *13/8; % angular frequencies for Earth and Venus
    c = (wv - we) * Rv % 2.8274

    % add A here   ;
    A=[0,-2*pi;2*pi,0];
    % add f here   ;
    f=c*[-1*sin(wv*t);cos(wv*t)];
    % calculate xdot here   ;
    xdot = A*x + f;
end

