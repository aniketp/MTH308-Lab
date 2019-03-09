format short

syms x;
fx = x ^ 3;
gx = x * cos(x);

f1 = int(fx, x);
f2 = -int(f1, x);

g1 = int(gx, x);
g2 = -int(g1, x);


n = 12;
main = [];

% Calculate the (-1 2 -1) banded matrix A(n), as asked in the problem
for i = 1:n
	temp= [];
	for j = 1:n
		if i == j
			temp = [temp 2];
		elseif (i == j-1 || j == i-1)
			temp = [temp -1];
		else
			temp = [temp 0];
		end
	end
	main = [main; temp];
end

main = main * (1/n+1) * (1/n+1);
inv_main = inv(main);

cubex = [];			% x^3
cosx = [];			% xcos(x)
cubx1 = [];
cosx1 = [];

% Obtain the column vector corresponding to each function
% and it's integral. To be used ahead
for (y = 1 : n)
	x = y * 1/(n+1)
	cubex = [cubex; subs(fx)];
	cosx = [cosx; subs(gx)];
	cubx1 = [cubx1; subs(f2)];
	cosx1 = [cosx1; subs(g2)];
end

e_xcubed = double(max(inv_main * cubex - cubx1)/max(cubx1));
e_cosx = double(cs = max(inv_main * cosx - cosx1)/max(cosx1));

fprintf("The value of e(u) for f(x) = x^3 is %i\n", e_xcubed);
fprintf("The value of e(u) for f(x) = xcos(x) is %i\n", e_cosx);

fprintf("\n The e(u) for x^3 is increasing\n");
fprintf("The value of e(u) for xcosx is decreasing\n");
