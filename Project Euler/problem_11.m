%Problem 11
clear
clc

r = readtable('problem_11_data.txt');
r = table2array(r);

v_h = zeros(20,20);
v_v = zeros(20,20);
v_d1 = zeros(20,20);
v_d2 = zeros(20,20);
v_d3 = zeros(20,20);
v_d4 = zeros(20,20);

for j = 1:5*4
    for i = 4:5*4
        v_v(i-3,j) = r(i-3,j)*r(i-2,j)*r(i-1,j)*r(i,j);
    end
end

for j = 1:5*4
    for i = 4:5*4
        v_h(j,i-3) = r(j,i-3)*r(j,i-2)*r(j,i-1)*r(j,i);
    end
end

l = 0;
j = 0;
while l <= 16
    for j = 4:(5*4)-l   
        v_d1(j+l-3,j-3) = r(j-3+l,j-3)*r(j-2+l,j-2)*r(j-1+l,j-1)*r(j+l,j);
    end
    l = l+1;
end

l = 0;
j = 0;
while l <= 16
    for j = 4:(5*4)-l   
        v_d2(j-3,j+l-3) = r(j-3,j-3+l)*r(j-2,j-2+l)*r(j-1,j-1+l)*r(j,j+l);
    end
    l = l+1;
end

l = 0;
h = 0;
j = 0;
while l <= 16
    for j = 5*4:-1:4+l
        v_d3(j-l,j-19+2*h) = r(j-l,j-19+2*h)*r(j-1-l,j-18+2*h)*r(j-2-l,j-17+2*h)*r(j-3-l,j-16+2*h);
        h = h+1;
    end
    l = l+1;
    h=0;
end

l = 0;
h = 0;
j = 0;
while l <= 1
    for j = 5*4:-1:4+l
        v_d4(j,j-19+2*h+l) = r(j,j-19+2*h+l)*r(j-1,j-18+2*h+l)*r(j-2,j-17+2*h+l)*r(j-3,j-16+2*h+l);
        h = h+1;
    end
    l = l+1;
    h=0;
end



rst = [v_v v_h v_d1 v_d2 v_d3 v_d4];

b = max(rst);
c = max(b);
disp('Result =');
disp(c);
