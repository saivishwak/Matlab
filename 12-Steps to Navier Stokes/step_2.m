%% -------------- Step Two Lorena A. Barba - CFD ----------------------- %%
%               1-D Non-Linear Convection - du/dt+udu/dx=0
clear
clc
close all

% Initialization
x_lower = 0;
x_upper = 2;
nx = 80;
dx = (x_upper-x_lower)/(nx-1);
x = linspace(x_lower,x_upper,nx);
nt = 50;
sigma = 0.5;
dt = sigma*dx;
c = 1;

% Boundary Conditions
u = ones(1,nx);
for i = 1:length(u)
    if x(i) >= 0.5 && x(i) <= 1
        u(i) = 2;
    end
end

for i = 1:nt
    un = u;
    for j = 2:nx
        u(j) = un(j) - u(j)*(dt/dx)*(un(j)-un(j-1)); 
    end
    pause(0.1)
    plot(x,u)
    axis([0 2 1 2])
end
