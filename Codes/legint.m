%Legrages Interpolation Method
%For forward interpolation enter in = 1
%For inverse interpolation enter in = 0
function yleg = legint(x,y,x_i,i_n)
c = x;
n = length(x);

if i_n == 0
    x = y;
    y = c;
end 

%Function
yleg = 0;

for i = 1:n
    xt=1;
    for j=1:n
        if j~=i 
       xt = xt*((x_i-x(j))/(x(i)-x(j)));
        end
    end
    yleg = yleg + xt*y(i);
end
