%% -------------- Step six Lorena A. Barba - CFD ---------------------- %%


clear
clc
close all

% Initialization
nx = 81;                                    % Number of x grid points
ny = 81;                                    % Number of y grid points
nt = 50;                                    % Time
x_lower = 0;                                % x lower boundary
x_upper = 2;                                % x upper boundary
y_lower = 0;                                % y lower boundary
y_upper = 2;                                % y upper boundary
dx = (x_upper-x_lower)/(nx-1);              % x step size
dy = (y_upper-y_lower)/(ny-1);              % y step size
sigma = 0.2;                                % stabilty constant
dt = sigma*dx;                              % time step size

% Grid Generation
x = linspace(x_lower,x_upper,nx);           % x grid points
y = linspace(y_lower,y_upper,ny);           % y grid points
[X,Y] = meshgrid(x,y);                      % grid space


% Initial Conditions
u = ones(nx,ny);
v = ones(nx,ny);
for i = 1:nx
    for j = 1:ny
        if x(i) >= 0.5 && x(i) <= 1
            if y(j) >= 0.5 && y(j) <= 1
                u(i,j) = 2;
                v(i,j) = 2;
            end
        end
    end
end


% Main Loop
for t = 1:nt
    un = u;
    vn = v;
    for i = 2:nx
        for j = 2:ny
            u(i,j) = un(i,j)-un(i,j)*(dt/dx)*(un(i,j)-un(i-1,j))-vn(i,j)*(dt/dy)*(un(i,j)-un(i,j-1));
            v(i,j) = vn(i,j)-un(i,j)*(dt/dx)*(vn(i,j)-vn(i-1,j))-vn(i,j)*(dt/dy)*(vn(i,j)-vn(i,j-1));
        end
    end
    pause(0.1)
    surf(X,Y,v(:,:))
end
