clear all
clc
%inputs
g = 9.8; % m/sec^2
c = 12.5; % Kg/s
m = 68.1; %Kg
t = linspace(0,50,50);
v_t = @(t) ((g*m)/c)*(1-exp(-(c*t)/m));
vel = v_t(t);
plot(t,vel);
title('Velocity Vs Time');
xlabel('Velocity (m/s)');
ylabel('Time (sec)');