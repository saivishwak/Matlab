%Problem 5
clear
clc
n = transpose(linspace(1,20,20));
a = transpose(100000000:1:1000000000);

for i = 1:length(a)   
    if rem(a(i,1),n(1,1)) == 0 && rem(a(i,1),n(2,1)) == 0 && rem(a(i,1),n(3,1)) == 0 && rem(a(i,1),n(4,1)) == 0 && rem(a(i,1),n(5,1)) == 0 && rem(a(i,1),n(6,1)) == 0 && rem(a(i,1),n(7,1)) == 0 && rem(a(i,1),n(8,1)) == 0 && rem(a(i,1),n(9,1)) == 0 && rem(a(i,1),n(10,1)) == 0 
        if rem(a(i,1),n(11,1)) == 0 && rem(a(i,1),n(12,1)) == 0 && rem(a(i,1),n(13,1)) == 0 && rem(a(i,1),n(14,1)) == 0 && rem(a(i,1),n(15,1)) == 0 && rem(a(i,1),n(16,1)) == 0 && rem(a(i,1),n(17,1)) == 0 && rem(a(i,1),n(18,1)) == 0 && rem(a(i,1),n(19,1)) == 0 && rem(a(i,1),n(20,1)) == 0
            disp(a(i,1));
        end
    end   
end
    
