%Problem 6
clear
clc

n = transpose(linspace(1,100,100));
n = n.^2;
n = sum(n);

v = transpose(linspace(1,100,100));
v = sum(v);
v = v^2;

s = v-n;
disp('Result = ')
disp(s);