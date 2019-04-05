% Create the interpolation points for function approximation
%
% Function signature: returns Chebyshev nodes
%
% Name: Aniket Pandey
% Roll: 160113
% Dept: B.S MTH

function [xGrid, fGrid] = discreteData(nGrid, a, b, f)
    xGrid = zeros(1, nGrid);
    fGrid = zeros(1, nGrid);
    
    for i = 1 : nGrid
        arg = pi * ((i - 1)/(nGrid - 1));
        xGrid(i) = (a + b)/2 + ((b - a)/2) * (cos(arg));
        fGrid(i) = f(xGrid(i));
    end
end