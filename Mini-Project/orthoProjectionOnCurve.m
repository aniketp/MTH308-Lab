% Orthogonal projection on a curve for a given point
%
% Function signature: returns the parameter t

function t0 = orthoProjectionOnCurve(x0, y0, X, Y, dXdt, dYdt, eps)
    a = eps/5;		% This needs to be checked for a possible optimisation
    % f(t) = (distance)^2
    dist = @(t) (X(t) - x0)^2 + (Y(t) - y0)^2;

    % Since the period of the given parametric curve is 1, the relevant
    % range of values of t is [0,1)
    % Take initial value of t0 and compute the corresponding distance.
    % We then find the value of t0 which gives the least distance.
    t0 = 0.0;
    d = dist(0.0);
    for t_iter = 0.1: 0.1: 0.9
        temp = dist(t_iter);
        if (temp < d)
            t0 = t_iter;
            d = temp;
        end
    end

    x_prime = @(t) 2*(X(t) - x0)*dXdt(t);
    y_prime = @(t) 2*(Y(t) - y0)*dYdt(t);
    grad_f =  @(t) x_prime(t) + y_prime(t);

    % Stop when difference between consecutive "t" is within 0.0001
    % We limit the number of iterations to be 50 as the initial value
    % of t was chosen fairly close to the solution, and hence 50
    % iterations is a
    count = 0;

    while ( abs(grad_f(t0)) > dist(eps) && count < 50)
        t0 = t0 - a*grad_f(t0);
        count = count + 1;
    end

end
