% Calculate the Jn matrix corresponding to the eigenvalue problem
for m = 2:5
    n = power(2, m);
    main = zeros(n, n);
    for (i = 1 : n)
        for (j = 1 : n)
            if eq(i, j - 1)
                main(i, j) = (j)/sqrt(4*j*j - 1);
            elseif eq(j, i - 1)
                main(i, j) = (i)/sqrt(4*i*i - 1);
            end
        end
    end
    
    % Calculate eigenvalues for respective value for n
    V = eig(main);
    for i = 1:n
        fprintf("The eigenvalue for n=%i is %f\n", n, V(i));
    end
end

