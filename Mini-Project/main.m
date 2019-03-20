function main()
    % the curve
    X    = @(t) sin(2*pi*t) + 3*sin(4*pi*t);
    Y    = @(t) 2*cos(2*pi*t) + 5*cos(24*pi*t);
    dXdt = @(t) 2*pi*cos(2*pi*t) + 12*pi*cos(4*pi*t);
    dYdt = @(t) -4*pi*sin(2*pi*t) - 120*pi*sin(24*pi*t);
	% point to be projected
    x0  = input('x0 = ');
    y0  = input('y0 = ');
    % desired accuracy
    eps = input('eps = ');
    tic;
    tc = orthoProjectionOnCurve(x0, y0, X, Y, dXdt, dYdt, eps);
    toc;
    tc
    [X(tc) Y(tc)]
end
