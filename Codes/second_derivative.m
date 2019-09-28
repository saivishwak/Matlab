%Second Derivative of a function using central difference
clear
clc
%Input
theta = 1;                          %Radians
func = @(x) cos(x);                 %Function
drfunc = @(x) -cos(x);              %Derived Function for Validation
h = 0.01;                           %Step size

%Calculation
v_x = func(theta-h);
v_xh = func(theta+h);
v_xh1 = 2*func(theta);
derivative = (v_xh+v_x-v_xh1)/h^2;
validate = drfunc(theta);

%Result
disp('Numerical Derivative')
disp(derivative);
disp('Analytical Derivative')
disp(validate);