% Construct a vector of evaluation points
for i = 1:1001
    xe(i) = -1 + 2*(j-1)/1000;
end

fprintf("Function: No => n   e(n)            log(e(n-1)/e(n))/log(n/n-1)\n");
% Calculate corresponding values of 'n' for the table
prev_val = [1 1 1 1];
prev_vale = [1 1 1 1];
for n = 2 : 10
    f1 = zeros(1001, 1);
    f2 = zeros(1001, 1);
    f3 = zeros(1001, 1);
    f4 = zeros(1001, 1);
    
    lagF = zeros(1001, 1);
    
    % Construct the vector for interpolation points
    for i = 0 : 1000
        x1(i+1) = (-1 + 2*i)/n;
        x2(i+1) = cos((2*i + 1)* pi/(2*n + 2));
    end
    
    
    % Define the functions in problem statement
    for i = 0 : 1000
        f1(i+1) = sin(x1(i+1));
        f2(i+1) = sin(abs(x1(i+1)));
        f3(i+1) = sin(x1(i+1) * sqrt(x1(i+1)));
        f4(i+1) = 1/(1 + 25 * power(x1(i+1), 2));
    end
    
    lagF = lagrangeBasis(x1, 1001, xe);     % Normal interpolation
    lagC = lagrangeBasis(x2, 1001, xe);     % Chebyshev interpolation
    
%     g1 = lagrangeBasis(x1, abs(f1(n+1)), xe);
%     g2 = lagrangeBasis(x1, abs(f2(n+1)), xe);
%     g3 = lagrangeBasis(x1, abs(f3(n+1)), xe);
%     g4 = lagrangeBasis(x1, abs(f4(n+1)), xe);
    
    % Construct the table
    val1 = []; val2 = [];
    vale1 = []; vale2 = [];
    
    % Errors for lagrange values (method)
    val1(1) = abs(real(1/min(min(f1-lagF))));
    val1(2) = abs(real(1/min(min(f2-lagF))));
    val1(3) = abs(real(1/min(min(f3-lagF))));
    val1(4) = abs(real(1/min(min(f4-lagF))));
    
    val2(1) = log(prev_val(1)/val1(1))/log(n/(n-1));
    val2(2) = log(prev_val(2)/val1(2))/log(n/(n-1));
    val2(3) = log(prev_val(3)/val1(3))/log(n/(n-1));
    val2(4) = log(prev_val(4)/val1(4))/log(n/(n-1));
    
    % Errors for Chebyshev method (value)
    vale1(1) = abs(real(1/min(min(f1-lagC))));
    vale1(2) = abs(real(1/min(min(f2-lagC))));
    vale1(3) = abs(real(1/min(min(f3-lagC))));
    vale1(4) = abs(real(1/min(min(f4-lagC))));
    
    vale2(1) = log(prev_vale(1)/vale1(1))/log(n/(n-1));
    vale2(2) = log(prev_vale(2)/vale1(2))/log(n/(n-1));
    vale2(3) = log(prev_vale(3)/vale1(3))/log(n/(n-1));
    vale2(4) = log(prev_vale(4)/vale1(4))/log(n/(n-1));
    
    for t = 1:4
        prev_val(t) = val2(t);
        prev_vale(t) = vale2(t);
        fprintf("Lagrange: f(%i) =>  %i   %e        %e\n", t, n, val1(t), val2(t));
        fprintf("Chebyshev: f(%i) =>  %i   %e        %e\n", t, n, vale1(t), vale2(t));
    end
end

% Function to calculate the lagrange basis
function [ ljx ] = lagrangeBasis(xj,j,x)
    % xj - an array containing the interpolation points
    % j - the jth basis function, j from 1 to length(xj)
    % x - an array of evaluation points
    n = length(xj);
    [neval,meval] = size(x);
    ljx = ones(neval,meval);
    
    for k = 1 : n
        if k ~= j
            ljx = ljx .* (x-xj(k)) ./ (xj(j)-xj(k));
        end
    end
end
