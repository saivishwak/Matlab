%False Position Method
clear all
clc
%function
false_p = @(x) exp(x)-sin(x);
%Inputs
x_lower = -3;
x_upper = -3.5;
x_mid = (x_upper*false_p(x_lower)-x_lower*false_p(x_upper))/(false_p(x_lower)-false_p(x_upper));

if false_p(x_lower)*false_p(x_upper)>0
    disp('The brackets are wrong');
end

while abs((x_upper-x_lower)/x_upper)>0.0001
    if (false_p(x_lower)*false_p(x_mid))>0
    x_lower = x_mid;
    else
        x_upper = x_mid;
    end
    x_mid = (x_upper*false_p(x_lower)-x_lower*false_p(x_upper))/(false_p(x_lower)-false_p(x_upper));
end
disp(' Root Value ')
disp(x_mid);
