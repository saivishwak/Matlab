%Problem 4
clear
clc

l = 99;

for i = 1:900
    v(i,1) = l+1;
    v(i,2) = l+1;
    l = l+1;
end

for i = 1:length(v)
    for j = 1:length(v)
        n = v(i,1)*v(j,2);
        p = str2double(fliplr(num2str(n)));
        if p == n
            f(i) = n;
        end
    end
end

s = max(f);
disp('Largest Palindrome')
disp(s);