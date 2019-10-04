%Monte Carlo Pi Simulation
clear
clc
close all
format long

%Input
r = 5;                  %Radius Of Circle
a = 2*r;                %Side of Square
n = 1000;               %Number of points
p = 0;
itr =0;
theta = linspace(0,360,n);
x = r*sind(theta);      %Circle x Points
x = transpose(x);       
y = r*cosd(theta);      %Circle Y Points
y = transpose(y);
x1 = [-5 -5 5 5 -5];    %Square X Points
y1 = [-5 5 5 -5 -5];    %Square Y Points
x2 = zeros(n,1);        %Random points Matrix for x
y2 = zeros(n,1);        %Random points Matrix for y

%Plot Circle and Square
plot(x,y,'b','Linewidth',2)
hold on
axis equal
plot(x1,y1,'b','Linewidth',2)
hold on 

%Plot Random Points
for i = 1:n
    x2(i) = (10*rand)-5;
    y2(i) = (10*rand)-5;
    plot(x2(i),y2(i),'ok');
    drawnow
    itr = itr +1;
    disp('Number of Points Generated =')
    disp(itr)
end

%Calculating Number of Points in circle
for i = 1:n
    if sqrt(x2(i)^2+y2(i)^2) <= r
        p = p+1;
    end
end

%Result
p_i = (4*p)/(n);
disp('Pi Approximation =')
disp(p_i)