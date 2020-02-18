%% --------------- Step ten Lorena A. Barba - CFD -------------------- %%
%                          Poisson Equation
clear
clc
close all

% Initialization
nx = 21;                                    % Number of x grid points
ny = 21;                                    % Number of y grid points
x_lower = 0;                                % x lower boundary
x_upper = 2;                                % x upper boundary
y_lower = 0;                                % y lower boundary
y_upper = 1;                                % y upper boundary
dx = (x_upper-x_lower)/(nx-1);              % x step size
dy = (y_upper-y_lower)/(ny-1);              % y step size

% Grid Generation
x = linspace(x_lower,x_upper,nx);           % x grid points
y = linspace(y_lower,y_upper,ny);           % y grid points
[X,Y] = meshgrid(x,y);                      % grid space

% Initial and Boundary Conditions
p = zeros(nx,ny);
b = zeros(nx,ny);
b(int8(nx/4),int8(ny/4)) = 100;
b(int8(3*nx/4),int8(3*ny/4)) = -100;

% Call Poisson Function
poisson_solver(X,Y,p,b,nx,ny,dy,dx)

% Poisson Equation Solver Function
function poisson_solver(X,Y,p,b,nx,ny,dy,dx)
error = inf;                                        % Inital error
it = 1;                                             % Initial Iteration
while error > 1e-6
    pn = p;
    for i = 2:nx-1
        for j = 2:ny-1
            p(i,j) = (dy^2*(pn(i+1,j)+pn(i-1,j))+dx^2*(pn(i,j+1)+pn(i,j-1))...
                -b(i,j)*dx^2*dy^2)/(2*(dx^2+dy^2));
        end
    end
    p(:,1) = 0;                                     % B.C at x = 0
    p(:,end) = 0;                                   % B.C at x = end
    p(1,:) = 0;                                     % B.C at y = 0
    p(end,:) = 0;                                   % B.C at y = end
    error = sum(abs(p(:)-pn(:)))./sum(abs(pn(:)));  % Relative Error
    fprintf('Iteration = %d\n',it)
    fprintf('Error = %f\r\n',error)
    it = it+1;
    pause(0.009)
    surf(X,Y,p(:,:))                                % Plotting
end
end


