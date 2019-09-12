%Newton Forward Difference Method
function yfn = newtonforward(x,y,x_i)

n = length(x);
p = ((x_i-x(1))/(x(2)-x(1)));
b = zeros(n,n);

% assign dependent variables to the first column of b.

b(:,1) = y(:); % the (:) ensures that y is a column vector.

for j = 2:n

for i = 1:n-j+1

b(i,j) = (b(i+1,j-1)-b(i,j-1));

end

end

xt = 1;
l = 1;
yfn = b(1,1);

for j = 1:n-1
    xt = xt*(p-(j-1));
 for i = j+1
     l = l*(i-1);
yfn = yfn+(b(1,j+1)*xt)/(l);
 end
end
end