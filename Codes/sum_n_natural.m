%Sum of N Natural Numbers
function v = sum_n_natural(n)
x = zeros(n,1);
x(1,1) = 1;
for i = 2:n
x(i,1) = 1+x(i-1);
end
v = sum(x);
end