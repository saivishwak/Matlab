%Problem 9
clear
clc

lower_l = 1;
upper_l = 1000;

a = transpose(lower_l:1:upper_l);
b = transpose(lower_l:1:upper_l);
c = transpose(lower_l:1:upper_l);

for i = 1:length(c)
    for j = 1:length(a)
        for k = 1:length(b)
            if c(i)^2 == a(j)^2 + b(k)^2 && c(i)+a(j)+b(k) == 1000
                disp(a(j));
                disp(b(k));
                disp(c(i));
                s = c(i)*a(j)*b(k);
                disp('Result =');
                disp(s);
                return
            end
            
        end
    end
end


