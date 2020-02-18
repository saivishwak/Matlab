%% -------------- Step Four Lorena A. Barba - CFD ---------------------- %%
%        1-D Convection-Diffusion - du/dt +u*(du/dt) = vd^2(u)/dt^2
clear
clc
close all

% Initialization
x_lower = 0;
x_upper = 2;
nx = 101;
dx = (x_upper-x_lower)/(nx-1);
x = linspace(x_lower,x_upper,nx);
nt = 100;
vis = 0.07;
dt = dx*vis;
for i = 1:nx
    ip1(i) = i+1;
    im1(i) = i-1;
end
ip1(nx) = 1;
im1(1) = nx;

% Initial  Conditions
u = ones(1,nx);
for i = 1:nx
    phi = exp(-x(i)^2/4*vis)+exp(-(x(i)-2*pi)^2/4*vis);
    phi_prime = (-0.5/vis)*x(i)*exp(-x(i)^2/4*vis)-(0.5/vis)*(x(i)-2*pi)...
        *exp(-(x(i)-2*pi)^2/4/vis);
    u(i) = (-2*vis*phi_prime/phi)+4;
end

% Main Loop
for i = 1:nt
    un = u;
    for j = 1:nx
        u(j) = un(j)+vis*(dt/dx^2)*(un(ip1(j))-2*un(j)+un(im1(j)))-un(j)...
            *vis*(dt/dx)*(un(j)-un(im1(j)));
    end
end

plot(x,u)
