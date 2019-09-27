%Molecule Collision Problem
clear
clc
close all
%Create Origin
n = 1000;
x = zeros(n,1);
y = zeros(n,1);
v = zeros(n,2);
v(1,1)= 2*rand-1;
v(1,2)= 2*rand-1;
x(1) = 0;
y(1) = 0;
figure('Name','Molecule Collisions','NumberTitle','off','position', [150 50 900 600])

for i = 2:n
    v(i,1) = 2*rand-1;
    v(i,2) = 2*rand-1;
    l = sqrt(v(i,1)^2+v(i,2)^2);
    x(i) = x(i-1)+v(i,1)/l;
    y(i) = y(i-1)+v(i,2)/l;
end

for i = 2:n  
plot([x(i-1),x(i)],[y(i-1),y(i)],'-k')
hold on
axis([-40 40 -40 40])
title('Random Walk')
xlabel('X')
ylabel('Y')
drawnow
end