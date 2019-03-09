format short

for m = 3 : 7
	n = 2 ^ m;
	main = [];
	
	% Construct A nxn banded matrix (-1 2 -1) matrix
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
		main = [main; temp];
	end
	
	A = main;
	
	b = []; x0 = [];
	
	% Construct b and x0
	for i = 1 : n
		b = [b; 1];
		if i == 1
			x0 = [x0; 1];
		else
			x0 = [x0; 0];
		end
	end
	x1 = x0;
	x2 = x0;
	
	% Construct exact X
	x_ex = zeros(n, 1);
	x_ex(1) = n/2;
	x_ex(2) = n-1;
	
	% Construct the column vector for the exact solution
	for i = 3 : n-1
		x_ex(i) = 2 * x_ex(i-1) - x_ex(i-2) - 1;
	end
	x_ex(n) = (x_ex(n-1) + 1)/2;
	
	tolerance = 10 ^ (-10);
	normvalue = Inf;
	iter_gs = 0;
	iter_gj = 0;
	
	%
	% Gauss Seidel Algorithm
	while (normvalue > tolerance)
		x_old = x1;
	
		for i = 1 : n
			sigma = 0;

			for j = 1 : i-1
					sigma = sigma + A(i,j) * x1(j);
			end

			for j = i + 1:n
					sigma = sigma + A(i,j)*x_old(j);
			end

			x1(i) = (1/A(i,i)) * (b(i) - sigma);
		end
		
		iter_gs = iter_gs + 1;
		normvalue = norm(x_old - x_ex, inf)/norm(x_ex, inf);
	end
	
	%
	% Gauss Jacobi Algorithm
	normvalue = Inf;
	while (normvalue > tolerance)
		x_old = x2;
	
		for i= 1 : n
			sigma = 0;

			for j = 1 : n
				if j ~= i
					sigma = sigma + A(i,j) * x2(j);
				end
			end

			x2(i) = (1/A(i,i)) * (b(i) - sigma);
		end
		
		iter_gj = iter_gj + 1;
		normvalue = norm(x_old - x_ex, inf)/norm(x_ex, inf);
	end
	
	rho_gj = (norm(x2)/norm(x0))^ (1/iter_gj);
	rho_gs = (norm(x1)/norm(x0))^ (1/iter_gs);
	phi = max(eig(A));
	
	fprintf("For n = %d\n", n);
	fprintf("Specific Convergence: Gauss Seidel = %d\n", rho_gs);
	fprintf("Specific Convergence: Gauss Jordan = %d\n", rho_gj);
	fprintf("The general convergence is %d\n", phi);
end

