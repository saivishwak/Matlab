%Euler Backward ODE Solver
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
%Implicit Function hence dependent on function; Change the 
%loop function accordingly
for i = 2:length(y)
    y(i,1) = (y(i-1)+h*x(i))/(1+h);
end

%Result
plot(x,y)