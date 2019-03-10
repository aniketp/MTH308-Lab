% Solution for problem 1
function problem1()
	for i = 1:10
	    diff = (factorial(i) - sqrt(2 * pi * i) * ((i/exp(1)) ^ i))
	    rel = diff/factorial(i)
	end
end

% Absolute error is increasing
% Relative error is decreasing

% Solution for problem 2
function problem2()
	for i = 5:5:50
		sum = 0
		for j = 0:i
			sum = sum + ((-5)^j)/factorial(j)
		end
		y = exp(-5) - sum
		fprintf('The sum is %f and actual is %f, relative error is %0.9f',sum, exp(-5), y)
	end


% Solution for problem 3
function problem3()
	x1 = 1/3
	x2 = 1/12
	y_axis = zeros(1, 60, 'double')
	y_modifed = zeros(1, 60, 'double')
	approx_mod = zeros(1, 60, 'double')
	approx_log = zeros(1, 60, 'double')
	x_axis = [1:60]
	y_axis(1,1) = x1
	y_modified(1,1) = log10(y_axis(1,1))
	y_modifed(1,2) = log10(y_axis(1,2))
	y_axis(1,2) = x2

	for i=3:60
		y_axis(1,i) = 2.25 * y_axis(1,i-1) - 0.5 * y_axis(1,i-2)
		y_modified(1, i) = log10(y_axis(1, i))
	end
	plot(x_axis, y_modified)

	for i=1:60
		approx = (4 ^ (1-i))/3
		approx_mod(1, i) = approx
		approx_log(1, i) = log10(approx_mod(1,i))
	end
	plot(x_axis, approx_log)
end 
