function d2ydx2 = d2uneven(y, x)
% d2ydx2 = D2UNEVEN(y, x)
% Compute the second derivative of y(x) for non-equally-spaced points using a
% three-points-centered stencil
% See formulas in https://doi.org/10.1098/rspa.2004.1430 (Bowen and Smith, 2005)
%
% Inputs must be:
%  * x is a column vector of sorted data (ascending or descending)
%  * y is a matrix having size(y, 1) == length(x)
%    and each column is an independent variable
%
% Output will be:
%  * d2ydx2: a matrix having size(d2ydx2) == size(y)
%    where each column is the second derivative of each column of y
%
% Derivatives at the edges are not computed (not enough points in the stencil)
%
% See usage.m for an example

% short-hands
a1 = x(1:end-2) - x(2:end-1);
a2 = x(2:end-1) - x(2:end-1);
a3 = x(3:end) - x(2:end-1);

fx1 = y(1:end-2, :);
fx2 = y(2:end-1, :);
fx3 = y(3:end, :);

d2 = ...
	2*fx1./((a1-a2).*(a1-a3)) + ...
	2*fx2./((a2-a1).*(a2-a3)) + ...
	2*fx3./((a3-a1).*(a3-a2));

% compile
d2ydx2 = zeros(size(y));
d2ydx2(2:end-1, :) = d2;
d2ydx2([1, end], :) = d2ydx2([2, end-1], :);
