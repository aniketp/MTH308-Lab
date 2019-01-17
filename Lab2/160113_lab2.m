function problem2
    format short;
    mat = [];
    rel_error = 0.000;
    n = 2;

    while (rel_error < 1.000)
        n = n + 1;
        for (i = 0 : n-1)
            temp = [];
            for (j = 1 : n)
                temp = [temp 1/(i+j)];
            end

            mat = [mat; temp];
        end

        mat_inv = inv(mat);

        % Calculate the single matrix corresponding to the input
        a_hat = single(mat);
        a_hat_inv = inv(a_hat);

        % rel(A) = ||inv(A) - inv(A')|| / ||inv(A)||
        rel_error = norm(mat_inv - a_hat_inv)/norm(mat_inv);
        cond = norm(mat) * norm(mat_inv);
        mat = [];
    end

    fprintf("Value of n is %i\nRelative error = %i\n", n, rel_error);
    fprintf("The value of condition number is %i\n", cond);
end
