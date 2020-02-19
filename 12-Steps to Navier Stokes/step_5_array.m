%% -------------- Step Five Lorena A. Barba - CFD ---------------------- %%
%              2-D Convection - du/dt + cdu/dx + cdu/dy = 0
clear
clc
close all

% Initialization
nx = 81;                                    % Number of x grid points
ny = 81;                                    % Number of y grid points
nt = 100;                                    % Time
x_lower = 0;                                % x lower boundary
x_upper = 2;                                % x upper boundary
y_lower = 0;                                % y lower boundary
y_upper = 2;                                % y upper boundary
dx = (x_upper-x_lower)/(nx-1);              % x step size
dy = (y_upper-y_lower)/(ny-1);              % y step size
sigma = 0.2;                                % stabilty constant
dt = sigma*dx;                              % time step size
c = 0.5;                                      % wave speed

% Grid Generation
x = linspace(x_lower,x_upper,nx);           % x grid points
y = linspace(y_lower,y_upper,ny);           % y grid points
[X,Y] = meshgrid(x,y);                      % grid space

% Initial Conditions
u = ones(nx,ny);
for i = 1:nx
    for j = 1:ny
        if x(i) >= 0.5 && x(i) <= 1
            if y(j) >= 0.5 && y(j) <= 1
                u(i,j) = 2;
            end
        end
    end
end

% Main Loop
for it = 1:nt
    un = u;
    u(2:nx,2:ny) = un(2:nx,2:ny)-(c*dt/dx).*(un(2:nx,2:ny)-un(1:nx-1,2:ny))-(c*dt/dy).*(un(2:nx,2:ny)-un(2:nx,1:ny-1));
    pause(0.1)
    surf(X,Y,u(:,:))
end