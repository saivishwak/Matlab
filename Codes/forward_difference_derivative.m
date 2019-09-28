%First Derivative of a function using forward difference
clear
clc
%Input
theta = 1;                          %Radians
func = @(x) cos(x);                 %Function
drfunc = @(x) -sin(x);              %Derived Function for Validation
h = 0.01;                           %Step size

%Calculation
v_x = func(theta);
v_xh = func(theta+h);
derivative = (v_xh-v_x)/h;
validate = drfunc(theta);

%Result
disp('Numerical Derivative')
disp(derivative);
disp('Analytical Derivative')
disp(validate);