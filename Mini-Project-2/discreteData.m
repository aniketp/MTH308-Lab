function [xGrid, fGrid] = discreteData(nGrid, a, b, f)
	xGrid = zeros(1,nGrid);
	fGrid = zeros(1,nGrid);
	
	for (i = 1 : nGrid)
		xGrid(i) = (a + b)/2 + ((b - a)/2) * (cos(pi*(i-1)/(nGrid - 1)));
		fGrid(i) = f(xGrid(i));
	end
end

        