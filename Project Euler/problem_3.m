%Problem 3
clear
clc

n =600851475143;

for i = 2:n
    if rem(n,i) == 0
        while rem(n,i) == 0
            n = n/i;
            disp(i);
        end
    end
end
    



