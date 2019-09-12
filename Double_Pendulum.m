%Double Pendulum Simulation with two pendulums
clear;
clc;
close all;

%Input Parameters
r_1 = 10;                       %Length of rod_1(m)
r_2 = 10;                       %Length of rod_2(m)                 
c_x = 0;                        %X origin
c_y = 0;                        %Y origin

%Initialization
tspan=100;                      %Time of simulation                     
theta_1_prime=0;                %Intial Condition
theta_2_prime=0;                %Initial Conditoin

%Inital Values for pendulum 1
theta_1=pi/2;                   %Angle of first ball
theta_2=pi/2;                   %Angle of second ball

%Inital Values for pendulum 2 
theta_12 = pi/2;                %Angle of first ball
theta_22 = (pi/2)+0.001;        %Angle of second ball


%Integrating pendulum 1 using ode45
y0=[theta_1 theta_1_prime theta_2 theta_2_prime];
[t,y]=ode45(@pend,[0,tspan],y0);

%Integratin pendulum 2 using ode45
y_0=[theta_12 theta_1_prime theta_22 theta_2_prime];
[t,y1]=ode45(@pend2,[0,tspan],y_0);


%Udating the points of pendulum 1
x_1=r_1*sin(y(:,1));
y_1=-r_1*cos(y(:,1));
x_2=r_1*sin(y(:,1))+r_2*sin(y(:,3));
y_2=-r_1*cos(y(:,1))-r_2*cos(y(:,3));


%Updating the points of pendulum 2
x_12=r_1*sin(y1(:,1));
y_12=-r_1*cos(y1(:,1));
x_22=r_1*sin(y1(:,1))+r_2*sin(y1(:,3));
y_22=-r_1*cos(y1(:,1))-r_2*cos(y1(:,3));


figure('Position',[10 10 900 600])
disp('Pendulum 1 = Black    Pendulum 2 = blue');

%Loop for Plotting the simulation
for i =1:length(y)
cla
plot([c_x, x_1(i), x_2(i)], [c_y, y_1(i), y_2(i)],'-ko');
hold on
plot([c_x, x_12(i), x_22(i)], [c_y, y_12(i), y_22(i)],'-o');
hold on
axis([-30 30 -30 30])
%Pendulum 1 points
plot(x_2(1:i), y_2(1:i), 'k','linewidth',1);
hold on
% %Pendulum 2 points
plot(x_22(1:i), y_22(1:i), 'b','linewidth',1);
title('Double Pendulum SImulation');
xlabel('x-axis');
ylabel('y-axis');
drawnow;
disp(['Time (sec) : ' num2str(t(i))]);
end


%ODE Function of the Double Pendulums

%Pendulum 1
function [yprime] = pend(t,y)   
r_1=10;                                 %Length of first rod
r_2=10;                                 %Length of second rod
m_1=10;                                 %Mass of first ball
m_2=20;                                 %Mass of second ball
g=9.8;                                  %Acceleration due to gravity
y_prime=zeros(4,1);
a = (m_1+m_2)*r_1 ;
b = m_2*r_2*cos(y(1)-y(3));
c = m_2*r_1*cos(y(1)-y(3));
d = m_2*r_2 ;
e = -m_2*r_2*y(4)* y(4)*sin(y(1)-y(3))-g*(m_1+m_2)*sin(y(1));
f = m_2*r_1*y(2)*y(2)*sin(y(1)-y(3))-m_2*g*sin(y(3));
yprime(1) = y(2);
yprime(3)= y(4);
yprime(2)= (e*d-b*f)/(a*d-c*b);
yprime(4)= (a*f-c*e)/(a*d-c*b);
yprime=yprime';
end

%Pendulum 2
function [yprime] = pend2(t,y1)     
r_1=10;                                  %Length of first rod
r_2=10;                                  %Length of second rod
m_1=10;                                  %Mass of first ball
m_2=20;                                  %Mass of second ball
g=9.8;                                   %Acceleration due to gravity
y_prime=zeros(4,1);
a = (m_1+m_2)*r_1 ;
b = m_2*r_2*cos(y1(1)-y1(3));
c = m_2*r_1*cos(y1(1)-y1(3));
d = m_2*r_2 ;
e = -m_2*r_2*y1(4)* y1(4)*sin(y1(1)-y1(3))-g*(m_1+m_2)*sin(y1(1));
f = m_2*r_1*y1(2)*y1(2)*sin(y1(1)-y1(3))-m_2*g*sin(y1(3));
yprime(1) = y1(2);
yprime(3)= y1(4);
yprime(2)= (e*d-b*f)/(a*d-c*b);
yprime(4)= (a*f-c*e)/(a*d-c*b);
yprime=yprime';
end
