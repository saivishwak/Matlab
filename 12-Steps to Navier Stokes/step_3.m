%% -------------- Step Three Lorena A. Barba - CFD ----------------------- %%
%              1-D Pure Diffusion - du/dt = vd^2(u)/dt^2
clear
clc
close all

% Initialization
x_lower = 0;
x_upper = 2;
nx = 41;
dx = (x_upper-x_lower)/(nx-1);
x = linspace(x_lower,x_upper,nx);
nt = 50;
sigma = 0.2;
vis = 0.3;
dt = sigma*dx^2/vis;

% Boundary Conditions
u = ones(1,nx);
for i = 1:length(u)
    if x(i) >= 0.5 && x(i) <= 1
        u(i) = 2;
    end
end

for i = 1:nt
    un = u;
    for j = 2:nx-1
        u(j) = un(j)+vis*(dt/dx^2)*(un(j+1)-2*un(j)+un(j-1)); 
    end
    pause(0.1)
    plot(x,u)
    axis([0 2 1 2])
end


              