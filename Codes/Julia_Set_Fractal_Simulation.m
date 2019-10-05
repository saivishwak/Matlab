%Julia Set Fractal Simulation
clear
clc
close all

%Input
maxitr = 200;               %Number of Iterations
x_limit = [-2,2];           %x axis limits
y_limit = [-2,2];           %y axis limits
dx = 1000;                   %Number of points
dy = 1000;

%Creating Grid Points
x = linspace(x_limit(1),x_limit(2),dx);
y = linspace(y_limit(1),y_limit(2),dy);
[x_g,y_g] = meshgrid(x,y);  %Creating Meshgrid with points

%Set of all Up Grid Matrix
count = ones(size(x_g));

%Complex Number
c = x_g +1i*y_g;
c1 = -0.4 + 0.6i;

%Initial Condition
z = c;

%Main Loop
figure('Name','Fractal Simulation','NumberTitle','off','position',[170 70 1000 600]);
for j = 1:maxitr
    z = z.*z + c1;
    inside = abs(z)<= 2;
    count = count + inside;
    imagesc(x,y,count);         %Create image from array
    colormap default
    axis on
    title('Jullia Set Fractal Simulation')
    drawnow
end

