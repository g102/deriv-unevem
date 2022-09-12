function dydx = d1uneven(y, x)
% dydx = D1UNEVEN(y, x)
% Compute the first derivative of y(x) for non-equally-spaced points using a
% three-points-centered stencil
% See formulas in https://doi.org/10.1098/rspa.2004.1430 (Bowen and Smith, 2005)
%
% Inputs must be:
%  * x is a column vector of sorted data (ascending or descending)
%  * y is a matrix having size(y, 1) == length(x)
%    and each column is an independent variable
%
% Output will be:
%  * dydx: a matrix having size(dydx) == size(y)
%    where each column is the first derivative of each column of y
%
% Derivatives at the edges are estimated with nearest-neighbour
%
% See usage.m for an example

% short-hands
a1 = x(1:end-2) - x(2:end-1);
a2 = x(2:end-1) - x(2:end-1);
a3 = x(3:end) - x(2:end-1);

fx1 = y(1:end-2, :);
fx2 = y(2:end-1, :);
fx3 = y(3:end, :);

d1 = ...
	-(a2+a3).*fx1./((a1-a2).*(a1-a3)) + ...
	-(a1+a3).*fx2./((a2-a1).*(a2-a3)) + ...
	-(a1+a2).*fx3./((a3-a1).*(a3-a2));

% compile
dydx = zeros(size(y));
dydx(2:end-1, :) = d1;
dydx([1, end], :) = dydx([2, end-1], :); % add missing points with n.n.
