% Solution for required values of n
prevG1 = 1;
prevG2 = 1;
prevC1 = 1;
prevC2 = 1;
fprintf("n | Function name      | eG(j,n) | eG(j,n)/eG(j,n/2) | eC(j,n) | eC(j,n)/eC(j,n/2)\n");

for m = 1:7
    n = power(2, m);
    J = zeros(n);
    for j = 1:n-1
        J(j,j+1) = j/sqrt(4*j^2-1);
        J(j+1,j) = j/sqrt(4*j^2-1);
    end
    xg = eig(J);
    
    % Construct 'A' matrix
    A = zeros(n);
    b = zeros(n, 1);
    for i = 1:n
        for j = 1:n
            A(i,j) = power(xg(j), i);
        end
        
        % calculate the weight vector
        if mod(i-1, 2) == 0
            b(i) = 2/i;
        else
            b(i) = 0;
        end
    end
    
    % Calculate the approximate integrals
    f1 = @(t) 1/(1+t^2);
    f2 = @(t) sin(pi*abs(t));
    
    % Define the functions to be integrated
    syms x;
    I1 = int(f1(x), -1, 1);
    I2 = int(f2(x), -1, 1);
    
    % Calculate the Gaussian Quadrature
    quad1 = 0;
    quad2 = 0;
    for i = 1:n
        quad1 = quad1 + b(i)*f1(xg(i));
        quad2 = quad2 + b(i)*f2(xg(i));
    end
    
%     fprintf("Gaussian error for n = %d, is %f\n", n, quad1 - I1);
    errG1 = quad1 - I1;
    errG2 = quad2 - I2;
    
    % Calculate Clenshaw-curtis quadrature points
    cs = zeros(n, 1);
    for j = 1: n
        cs(j) = cos((2*j - 1)*pi/(2*n));
    end
    
    % Calculate exact and approximate integral using above rule
    quad1 = 0;
    quad2 = 0;
    for i = 1:n
        quad1 = quad1 + b(i)*f1(cs(i));
        quad2 = quad2 + b(i)*f2(cs(i));
    end
    
    errC1 = quad1 - I1;
    errC2 = quad2 - I2;
    
    fprintf("%d | Function 1/(1+x^2) | %f | %f | %f | %f\n", n, errG1, errG1/prevG1, errC1, errC1/prevC1);
    fprintf("%d | Function sin(pi|x|) | %f | %f | %f | %f\n", n, errG2, errG2/prevG2, errC2, errC2/prevC2);
    
    prevG1 = errG1;
    prevG2 = errG2;
    prevC1 = errC1;
    prevC2 = errC2;
end
