%Euler Forward ODE Solver
clear
clc
close all

%Inputs
func = @(x,y) x-y^2;
h = 0.025;
x_upper_lim = 2;
x_0 = 0;
x = transpose(x_0:h:x_upper_lim);
y = zeros(length(x),1);
%Initial Boundary Condition
y(1,1) = 1;

for i = 2:length(y)
    y(i,1) = y(i-1)+h*func(x(i-1),y(i-1));
end

%Result
plot(x,y)