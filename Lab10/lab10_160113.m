% Computes the polynomial value at specified (x, n)
function val = evalPoly(x, n)
	val = 1/(2 * n + 1);
	sign = 1;   % 1: +ve; -1: -ve;
	
	% Use the specfied algorithm to calculate the polynomial 
	while (n > 0)
		val = (x * x * val) - sign/(2*(n-1) + 1);
		n = n - 1;
		sign = -sign;
	end
	
	% The power of x is odd; Multiply one final x at the end
	val = x * val;
end

% Compute single entries corresponding to the provided function
computeCol1 = @(n) abs(pi - 6*evalPoly(1/sqrt(3), n)) / pi;
computeCol2 = @(n) abs(pi - 4*evalPoly(1, n)) / pi;

x = 8;
while x <= 4096
	fprintf('%5d  %e  %e\n', x, computeCol1(x), computeCol2(x));
	x = x*2;
end
