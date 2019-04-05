% the script file for testing the code

% the interval of approximations
a = 0;          % the value of the left end-point of the interval
b = 10;         % the value of the right end-point of the interval

% the function to be approximated
f = @(x) ((x-a)*(b-x))^11;

% approximation grid size
nGrid = 100;            % size of the grid to be used for approximation
[xGrid, fGrid] = discreteData(nGrid, a, b, f);

% the number of test evaluation points
nEval = 10;
xEval = a + (b-a).*rand(1,nEval); % evaluation grid to be used for testing

tic;
%exact = f(xEval);
exact = zeros(1, nEval);
for i=1:nEval
    exact(i) = f(xEval(i));
end
%---------------------------------------------------
approx = approxFunction(xEval, xGrid, fGrid);

maxExact = max(abs(exact)); % the max norm of f
maxError = max(abs(approx-exact)); % the max norm of error
toc;

maxError/maxExact
