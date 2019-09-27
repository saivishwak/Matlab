% Solving Coefficients of Polynomial
function c = poly_coefficients(x,y)
y = transpose(y);
n_l = length(x);
n = n_l-1;
z = zeros(n_l,n_l);
z(:,n_l) = 1;

%Function
for i = 1:n_l
    for j = 1:n_l
    z(i,j) = x(i).^(j-1);
    end
end
c = z\y;
c = flip(c);



