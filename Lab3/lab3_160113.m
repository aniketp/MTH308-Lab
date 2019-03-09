function [found, actual] = lab3(A)
	if ~(ismatrix(x) && diff(size(x)))
		error("Matrix is not square");
	end

	% Obtain the L-U decomposition of the provided matrix
	[L, U] = lu(A);
	
	dim = size(A, 1);
	ys = [];
	zs = [];
	n = [];
	
	% For a randomly chosen y, obtain z = A\y and use it to 
	% estimate the condition number of the matrix
	for (i = 1 : dim)			  % Change this to 5 later
		ys = [ys rand(dim, 1)];
		zs = [zs A\ys(:,i)];
		n(i) = norm(zs(:, i), 1)/norm(ys(:, i), 1);
	end
	
	actual = norm(A, 1) * norm(inv(A), 1);
	found = norm(A, 1) * max(n);
	
	fprintf("The obtained condition number for 1-norm is %i\n", found);
	fprintf("The actual condition number for 1-norm is %i\n", actual);
end
