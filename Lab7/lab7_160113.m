format short

for m = 1 : 2
	n = power(2, m);
	
	% Create the initial normalized guess for x0
	x0 = ones(n, 1);
	x0 = x0/norm(x0);
	
	A = [];
	% Construct A(n x n) (-1 2 -1) banded matrix
	for (i = 1 : n)
		temp = [];
		for (j = 1 : n)
			if eq(i, j)
				temp = [temp 2];
			elseif or(eq(i, j - 1), eq(j, i - 1))
				temp = [temp -1];
			else
				temp = [temp 0];
			end
		end
		A = [A; temp];
	end

	% Initial estimate and appropriate setup for the Newton-Raphson method	
	tolerance = power(10, -10);
	x_diff = Inf;
	ld0 = mtimes(mtimes(transpose(x0), A), x0);
	f_x = [(A - ld0 * eye(n)) (-x0); (2 * transpose(x0)) (0)];
	f = [mtimes(A, x0) - ld0 * x0; mtimes(transpose(x0), x0) - 1];
	
	y0 = [x0; ld0];
	
	while (x_diff > tolerance)
		y_new = y0 - mtimes(inv(f_x), f);
		y0 = y_new;
		y_new(n) = [];
		x0 = y_new;
		ld0 = mtimes(mtimes(transpose(x0), A), x0);
		
		% Calculate the jacobian
		f_x = [(A - ld0 * eye(n)) (-x0); (2 * transpose(x0)) (0)];
		f = [mtimes(A, x0) - ld0 * x0; mtimes(transpose(x0), x0) - 1];
		
		% Update x_n for the next iteration
		x_diff = norm(f);
	end
	
	fprintf("Eigenvalue is : Lambda is %i\n", ld0);
	fprintf("Tolerance is %i\n", x_diff);
	fprintf("")
 end
