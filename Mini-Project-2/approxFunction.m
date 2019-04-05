% Chebyshev Interpolation of a Function f(x) based on the
% provided discrete computational Grid [X, F{X}]
%
% Function signature: returns the evaluation vector 'approx'
%
% Name: Aniket Pandey
% Roll: 160113
% Dept: B.S MTH
%
% Bibliography: Finding the Zeros of a Univariate Equation: Proxy
% Rootfinders, Chebyshev Interpolation, and the Companion Matrix
% https://epubs.siam.org/doi/pdf/10.1137/110838297

function approx = approxFunction(xEval, xGrid, fGrid)
    gridLen = length(xGrid);
    evalLen = length(xEval);

    % Precomputed helper coefficient vector
    p = ones(1, gridLen);
    p(1)= 2;
    p(gridLen) = 2;
    
    % Compute the elements of the (n+1)x(n+1) Interpolation Matrix
    I = zeros(gridLen);
    for j = 1 : gridLen
        for k = 1 : gridLen
            arg = pi * (j-1) * ((k-1)/(gridLen-1));
            denom = p(j) * p(k) * (gridLen-1);
            I(j,k) = 2 * (cos(arg)/denom);
        end
    end
    
    % Compute the coefficients through vector-matrix multiplication
    coeff = (I * fGrid')';
    approx = zeros(1, evalLen);
    
    % The vector-matrix multiplication can be accelerated by the Fast-Fourier
    % Transform (FFT), but since this vector-matrix multiplication costs O(2N^2)
    % while the eigensolving cost is O(10N^3), FFT is scarcely worth the effort.
    for k = 1 : evalLen
        for j = 1 : gridLen
            denom = xGrid(1) - xGrid(gridLen);
            arg = (2 * xEval(k)) - (xGrid(1) + xGrid(gridLen));
            result = coeff(j) * cos((j-1) * acos(arg/denom));
            approx(k) = approx(k) + result;
        end
    end
end