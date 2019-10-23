%Lorenz System Simulation
clear
clc
close all
%Input Parameters
sigma = 6;
beta = 5/3;
rho = 28;
b = [0.2 1 0.5];           %Boundary Conditions
%Function
f = @(t,a) [-sigma*a(1) + sigma*a(2); rho*a(1) - a(2) - a(1)*a(3); -beta*a(3) + a(1)*a(2)];
%Solving Differnetial System of Equations
[t,a] = ode45(f,[0 100],b);     % Runge-Kutta 4th/5th order ODE solver

%Results
for i = 2:length(t)
set(gca,'color','k');           %Set axis color
set(gcf,'color','k');           %Set figure color
plot3([a(i-1,1) a(i,1)],[a(i-1,2) a(i,2)],[a(i-1,3) a(i,3)],'Color', [0.9800, 0.5100, 0.1700]);
hold on
%axis off                        %turn off axis
axis([-50 50 -50 50 -50 50])
drawnow
end