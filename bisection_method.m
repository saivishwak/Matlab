%Bisection Method
clear all
clc
bisection = @(x) exp(x)-sin(x);
x_lower = -4;
x_upper = -3;
x_mid = (x_lower+x_upper)/2;
if bisection(x_lower)*bisection(x_upper) > 0.0
    error('The brackets are wrong')
end
while abs((x_upper-x_lower)/x_upper)>0.0005
    if (bisection(x_mid)*bisection(x_upper))<0
        x_lower = x_mid;
    else
        x_upper = x_mid;
    end
    x_mid = (x_lower+x_upper)/2;
end
disp(' Root value');
disp(x_mid);
