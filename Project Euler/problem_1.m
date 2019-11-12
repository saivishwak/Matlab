%Problem 1
%If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
%The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.
clear
clc
lim = 999;
z = zeros(333,1);
c =0;

for i = 1:lim
    z(i,1) = c+1;
    c = c+1;
end

v = zeros(10,1);
r = 0;
for i = 1:lim
    v(i,1) = r+1;
    r = r+1;
    for j = 1:333
        if v(i,1)/3 == z(j,1)
            x(i) = i;
        end
    end
    for j = 1:333
        if v(i,1)/5 == z(j,1)
            x(i) = i;
        end
    end
end

s = sum(x);
disp('Sum = ');
disp(s);