%Definite Integration
clear
clc
close all

%Input
func = @(x) exp(x);                 %Function
dx = 0.001;                         %Step Size
l_limit = 1;                        %Lower Limit
u_limit = 3;                        %Upper Limit
n = (u_limit-l_limit)/dx;
a = zeros(n,1);
z = zeros(n,1);

%Main Loop
for i = 1:n
    z(i) = func(l_limit);
    a(i) = (z(i)*dx);
    l_limit = l_limit+dx;
end

%Results
l_limit = 1;                        %Lower Limit for Plotting
fplot(func,[l_limit u_limit])
title('Plot of The Function')
xlabel('x');
ylabel('y');
s = sum(a);
disp('Integral Value');
disp(s);