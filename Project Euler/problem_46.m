%Problem 46
%{
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2
It turns out that the conjecture was false.
What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
%}

clear
clc

lim = 10000;
v = linspace(1,lim,lim);
v = transpose(v);

p = primes(lim);
p = transpose(p);

for i=1:lim
    for j = 1:length(p)
        if v(i,1) == p(j,1)
            v(i,1) = 0;
        end
    end
end

n = linspace(1,lim,lim);
n = transpose(n);

%Odd Primes
for i = 1:lim
    for j = 1:lim
        if v(i,1)/2 == n(j,1)
        else
            x(i) = v(i,1);
        end
    end     
end
x = transpose(x);

for i = 1:lim
    for j = 1:lim
        if x(i,1)/2 == n(j,1)
            y(i,1) = x(i,1);
        end
    end
end

%z is the odd composite numbers matrix
m = x-y;
m(1,1) = 0;
z = nonzeros(m);

for i = 1:length(z)
    for k = 1:length(p)
        for j = 1:length(n)
            if z(i,1) == p(k,1)+2*(n(j,1)).^2
            q(i,1) = z(i,1);
            end
        end
    end
end
w = z-q;

for i = 1:length(w)
    if w(i,1) ~= 0
        disp(w(i,1))
    end
end

