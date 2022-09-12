# deriv-uneven
Functions to compute the derivative of a function on non-regular (uneven) spacing.

This repo contains two functions: 
 * `d1uneven` to estimate the first derivative, and 
 * `d2uneven` to estimate the second derivative.

Formulas here are taken from Bowen and Smith (2005): https://doi.org/10.1098/rspa.2004.1430

These take the same inputs:
 * `y`: matrix of the observations of *y(x)* at given points; this is an Nx × M matrix, where each column is treated as an independent function,
 * `x`: vector of the grid points *x* where *y(x)* is observed; this is an Nx × 1 matrix (a column vector).
 
With the output being:
 * `dy`: matrix having the same size as `y` which contains either the first or second derivative of each column in `y`.

For usage, refer to `usage.m` and/or the individual HELP of each function.


### Author
Stefano Gambuzza \
(stefanogambuzza AT duck DOT com)



