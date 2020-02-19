%% --------------- Step Eleven Lorena A. Barba - CFD ------------------- %%
%                    Cavity Flow With Navier-Stokes
clear
clc
close all

% Initialization
nx = 41;                                    % Number of x grid points
ny = 41;                                    % Number of y grid points
nt = 100;                                   % Number of time steps
nit = 50;
x_lower = 0;                                % x lower boundary
x_upper = 2;                                % x upper boundary
y_lower = 0;                                % y lower boundary
y_upper = 2;                                % y upper boundary
dx = (x_upper-x_lower)/(nx-1);              % x step size
dy = (y_upper-y_lower)/(ny-1);              % y step size
dt = 0.001;                                 % time step size
rho = 1;                                    % Density
vis = 0.1;

% Grid Generation
x = linspace(x_lower,x_upper,nx);           % x grid points
y = linspace(y_lower,y_upper,ny);           % y grid points
[Y,X] = meshgrid(y,x);                      % grid space

% Initial Condition
u = zeros(ny,nx);
v = zeros(ny,nx);
p = zeros(ny,nx);
b = zeros(ny,nx);

% Main Loop
for it = 1:nt+1
        for i=2:(nx-1)
            for j=2:(ny-1)
                b(i,j)=rho*(1/dt*((u(i+1,j)-u(i-1,j))/(2*dx)+(v(i,j+1)-v(i,j-1))...
                    /(2*dy))-((u(i+1,j)-u(i-1,j))/(2*dx))^2-2*((u(i,j+1)-u(i,j-1))...
                    /(2*dy)*(v(i+1,j)-v(i-1,j))/(2*dx))-((v(i,j+1)-v(i,j-1))/(2*dy))^2);
            end
        end
    for iit=1:nit+1
        pn=p;
        for i=2:(nx-1)
            for j=2:(ny-1) 
            p(i,j)=((pn(i+1,j)+pn(i-1,j))*dy^2+(pn(i,j+1)+pn(i,j-1))*dx^2)...
                /(2*(dx^2+dy^2))-dx^2*dy^2/(2*(dx^2+dy^2))*b(i,j);
            end
        end
        p(:,ny) =p(:,ny-1); %%dp/dy = 0 at y = 2
        p(1,:) = p(2,:);    %%dp/dy = 0 at y = 0
        p(:,1)=p(:,2);      %%dp/dx = 0 at x = 0
        p(:,ny)=0;          %%dp = 0 at y = 2
 
    end
     
    un = u;
    vn = v;
     
    for j=2:nx-1
        for i=2:ny-1        
        %Velocity Field
        u(i,j) = un(i,j)-un(i,j)*dt/dx*(un(i,j)-un(i-1,j))-vn(i,j)*dt/dy*(un(i,j)-un(i,j-1))-dt...
            /(2*rho*dx)*(p(i+1,j)-p(i-1,j))+vis*(dt/dx^2*(un(i+1,j)-2*un(i,j)+un(i-1,j))+...
            (dt/dy^2*(un(i,j+1)-2*un(i,j)+un(i,j-1))));
        v(i,j) = vn(i,j)-un(i,j)*dt/dx*(vn(i,j)-vn(i-1,j))-vn(i,j)*dt/dy*(vn(i,j)-vn(i,j-1))-dt...
            /(2*rho*dy)*(p(i,j+1)-p(i,j-1))+vis*(dt/dx^2*(vn(i+1,j)-2*vn(i,j)+vn(i-1,j))+...
            (dt/dy^2*(vn(i,j+1)-2*vn(i,j)+vn(i,j-1))));
        end
    end
        u(1,:)=0;
        u(:,1)=0;
        u(nx,:)=0;
        u(:,ny)=1;
        v(1,:)=0;
        v(ny,:)=0;
        v(:,1)=0;
        v(nx,:)=0;
end

% Plot
contourf(x,y,p.','linewidth',0.01);
hold on
quiver(x,y,u.',v.',2)
xlabel('x')
ylabel('y')
colorbar
