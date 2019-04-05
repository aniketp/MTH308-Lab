function approx = approxFunction(xEval, xGrid, fGrid)
    n = length(xGrid);
    m = length(xEval);
    
    approx=zeros(1,m);
    a=xGrid(n);
    b=xGrid(1);
    I=zeros(n);
    coeff=zeros(1,n);
    p = ones(1,n);
    p(1)= 2;
    p(n) = 2;
    for j=1:n
        for k=1:n            
            I(j,k)=(2*cos(pi*(j-1)*((k-1)/(n-1))))/(p(j)*p(k)*(n-1));
        end
    end
   co = I*fGrid';
   coeff = co';          %computing coefficients
    for k=1:m
        for j=1:n
            approx(k)=approx(k)+(coeff(j)*cos((j-1)*acos((2*xEval(k)-(b+a))/(b-a))));  %computing value of function
        end
    end
    
end