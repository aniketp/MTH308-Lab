% Orthogonal projection on a curve for a given point
%
% Function signature: returns the parameter t
%
% Name: Aniket Pandey
% Roll: 160113

function t0 = orthoProjectionOnCurve(x0, y0, X, Y, dXdt, dYdt, eps)
    DEBUG = false;

    % f(t) = (distance)^2 (to be minimised)
    dist = @(t) (X(t) - x0)^2 + (Y(t) - y0)^2;

    % Since the period of the given parametric curve is 1, the relevant
    % range of values of t is [0,1)
    % Divide the curve in 200 sections and find the one with minimum
    % distance. That is the starting point for next step.
    t0 = 0.0;
    d_min = dist(t0);
    for t_iter = 0.0: 0.005: 0.995
        d_cur = dist(t_iter);
        if (d_cur < d_min)
            t0 = t_iter;
            d_min = d_cur;
        end
    end
    if DEBUG
        fprintf("DEBUG: Min Distance of all sections is: %f\n", d_min);
    end

    A = @(t) [X(t) - x0, Y(t) - y0];
    B = @(t) [dXdt(t), dYdt(t)];
    cosine = @(t) dot(A(t), B(t))/ (norm(A(t), 2) * norm(B(t), 2));

    % Core of the modified Steepest Descent Algorithm and Newton-Raphson method
    % Stop when the absolute value of cosine is contained within the provided
    % error (epsilon). To avoid an infinite loop in case of a malicious input or
    % a badly conditioned function, we restrict the number of iterations to 5000.
    count = 0;
    while (abs(cosine(t0)) > eps && count < 5000)
        t0 = t0 - (eps/2)*cosine(t0);
        count = count + 1;
    end

    if DEBUG
        fprintf("DEBUG:\n\tcosine: %i\n\teps: %i\n\tcount: %i\n\tdist: %i\n\n",...
            cosine(t0), eps, count, dist(t0));
    end
end

