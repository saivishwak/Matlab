%Newton Raphson Method
clear all
clc
syms x
newton_rap = @(x) 10*x^3-25.0425*x^2-3.592*x-0.1532;
diff_f = matlabFunction( diff(newton_rap(x)) );
%inputs
x_initial = 0;
x_mid = x_initial-(newton_rap(x_initial)/diff_f(x_initial));

while abs((x_mid-x_initial)/x_mid)>0.00001
    x_initial = x_mid;
    x_mid = x_initial-(newton_rap(x_initial)/diff_f(x_initial));
end
disp(' Root value ');
disp(x_mid);