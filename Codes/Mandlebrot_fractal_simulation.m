%Mandelbrot Set Fractal Simulation
clear
clc
close all
%Inputs
maxitr = 200;
x_limit = [-1.5, 0.6];             %x axis limit
y_limit = [-1, 1];                 %y axis limit
dx = 3000;                        %Number of points to be created
dy = 3000;

%Creating all possible complex numbers
x = linspace(x_limit(1),x_limit(2),dx);
y = linspace(y_limit(1),y_limit(2),dy);
[x_g,y_g] = meshgrid(x,y);

%Complex Numbers
c = x_g + 1i*y_g;
count = ones(size(c));

%Initial Condition
z = c;

%Main Loop
for j = 1:maxitr
    z = z.*z +c;
    inside = abs(z)<= 2;
    count = count + inside;
    imagesc(x,y,count);                         %Creates an image from an array
    colormap default
    title('Mandelbrot Fractal Simulation')
    axis on
    drawnow
end