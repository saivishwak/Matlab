%Runge-Kutta 2nd order ODE Solver
clear
clc
close all

%Inputs
func = @(x,y) x-y;
h = 0.025;
x_upper_lim = 2;
x_0 = 0;
x = transpose(x_0:h:x_upper_lim);
y = zeros(length(x),1);
%Initial Boundary Condition
y(1,1) = 1;

for i = 2:length(y)
    k_1 = h*(func(x(i-1),y(i-1)));
    k_2 = h*(func(x(i),y(i-1)+k_1));
    y(i,1) = y(i-1)+(1/2)*(k_1+k_2);
end

%Result
plot(x,y)