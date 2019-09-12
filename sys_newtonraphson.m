%System of equation using Newton Raphson Method
clear all
clc
syms x y
f = @(x,y) 3*y*x^2-10*x+7;   %Function 1
g = @(x,y) y^2-5*y+4;        %Function 2
diff_fx = matlabFunction( diff(f,x) );
diff_fy = matlabFunction( diff(f,y) );
diff_gx = matlabFunction( diff(g,x) );
diff_gy = matlabFunction( diff(g,y) );

%inputs
x_initial = 0.5;
y_initial = 0.5;
x = x_initial;
y = y_initial;

for i = 1:3 % 3 iterations
A = [diff_fx(x,y),diff_fy(x);diff_gx(),diff_gy(y)];
B = [-f(x_initial,y_initial);-g(x_initial,y_initial)];
C = A\B;
h = C(1);
k = C(2);
x = x_initial + h;
y = y_initial +k;
x_initial = x;
y_initial = y;
end
disp(' x value ');
disp( x );
disp(' y value ');
disp( y );
