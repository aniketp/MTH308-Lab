function main()
    % the curve
    X    = @(t) 2*cos(2*pi*t);
    Y    = @(t) 3*sin(2*pi*t);
    dXdt = @(t) -4*pi*sin(2*pi*t);
    dYdt = @(t) 6*pi*cos(2*pi*t);
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
