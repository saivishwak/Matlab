%Runge-Kutta 3rd order ODE Solver
clear
clc
close all

%Inputs
func = @(x,y) -2*y+x+4;
h = 0.2;
x_upper_lim = 2;
x_0 = 0;
x = transpose(x_0:h:x_upper_lim);
y = zeros(length(x),1);
%Initial Boundary Condition
y(1,1) = 1;

for i = 2:length(y)
    k_1 = (h)*(func(x(i-1),y(i-1)));
    k_2 = (h)*(func(x(i-1)+(h/2),(y(i-1)+(k_1/2))));
    k_3 = (h)*(func(x(i-1)+h,(y(i-1)+(k_1/2)+k_2/2)));
    y(i,1) = y(i-1)+(1/6)*(k_1+4*k_2+k_3);
end

v = transpose(x_0:h:x_upper_lim);
ex(:,1) = -0.75*exp(-2.*v)+0.5.*v+1.75;
%Result
plot(x,y,'-ko')
hold on
plot(v,ex,'-bo')
legend('Numerical','Exact')