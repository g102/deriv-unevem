% This script presents an example on how to use d1uneven and d2uneven
clear;
close all;

% Define a non-uniformly spaced line of x by adding noise to a regularly-spaced
% line
x = linspace(0, 1);
x = x + 0.1 * (rand(size(x))-1/2);

% ensure this is sorted and in column vector format
x = sort(x);
x = x(:);

% let's define two functions of which we know the analytical form
y(:, 1) = x .* log(1+x);
y(:, 2) = x.^2 + exp(x);

% and their first and second derivatives, analytically
d1y_an(:, 1) = log(1+x) + x./(1+x);
d1y_an(:, 2) = 2*x + exp(x);
d2y_an(:, 1) = (x+2)./((1+x).^2);
d2y_an(:, 2) = 2 + exp(x);

% now compute the derivatives with finite differences
d1y_num = d1uneven(y, x);
d2y_num = d2uneven(y, x);

% plot the results
figure();
axes('nextplot', 'add');
plot(x, d1y_an(:, 1), 'linewidth', 1, 'displayname', '$$\frac{dy_1}{dx}$$, analytical');
plot(x, d1y_num(:, 1), 'linewidth', 1, 'displayname', '$$\frac{dy_1}{dx}$$, computed', 'linestyle', '--');
plot(x, d1y_an(:, 2), 'linewidth', 1, 'displayname', '$$\frac{dy_2}{dx}$$, analytical');
plot(x, d1y_num(:, 2), 'linewidth', 1, 'displayname', '$$\frac{dy_2}{dx}$$, computed', 'linestyle', '--');
legend('interpreter', 'latex', 'location', 'nw');

figure();
axes('nextplot', 'add');
plot(x, d2y_an(:, 1), 'linewidth', 1, 'displayname', '$$\frac{d^2y_1}{dx^2}$$, analytical');
plot(x, d2y_num(:, 1), 'linewidth', 1, 'displayname', '$$\frac{d^2y_1}{dx^2}$$, computed', 'linestyle', '--');
plot(x, d2y_an(:, 2), 'linewidth', 1, 'displayname', '$$\frac{d^2y_2}{dx^2}$$, analytical');
plot(x, d2y_num(:, 2), 'linewidth', 1, 'displayname', '$$\frac{d^2y_2}{dx^2}$$, computed', 'linestyle', '--');
legend('interpreter', 'latex', 'location', 'nw');

