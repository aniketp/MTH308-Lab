format short


A = [1 1/2 1/3; 1/2 1/3 1/4; 1/3 1/4 1/5];
[V, D, W] = eig(A);

% Pick eigenvectors corresponding to U and V (the first column)
u = V(:, 1:1);
v = W(:, 1:1);

cond = norm(u, 2) * norm(v, 2) / dot(u, v);
cond_t = min(condeig(A(1));

fprintf("The condition number of the matrix is %i\n", double(cond));
fprintf("The theoretical condition number of matrix is %i\n\n", double(cond_t));

% Question 2 
% Construct the required A(n) matrix for n = 2,4,8,16,32
for m = 1:5
    n = power(2, m);
    
    temp = zeros(n, n);
    for (i = 1 : n)
        for (j = 1 : n)
            if eq(i, j)
                if i ~= 1
                    temp(i, j) = 1/(i - 1);
                else
                    temp(i, j) = 0;
                end
            elseif eq(i, j - 1)
                temp(i, j) = -1;
            end
        end
    end
    
    [V, D, W] = eig(temp);
    % Pick eigenvectors corresponding to U and V
    u = V(:, 1:1);
    v = W(:, 1:1);
    cond = norm(u, 2) * norm(v, 2) / dot(u, v);
    fprintf("The condition number for n = %i is %i\n", n, cond);
    
    left = factorial(n-1);
    right = sqrt(n) * left;
    
	% Check if the obtained condition number lies between the given values
    if cond > left && cond < right
        fprintf("The condition of (n-1)! < cond(A) < sqrt(n)*(n-1)! is satisfied for n=%i\n", n);
    end
end

