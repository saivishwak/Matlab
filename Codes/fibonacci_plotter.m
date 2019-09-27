% Fibonacci Plotter
%function fib = fibonacci_plotter(k)
k = 100;
%Input
n = zeros(k,1);
n(1)=1;
n(2)=1;
%Function
for i = 3:k
    n(i) = n(i-2) + n(i-1);
end
fib = sum(n);
%end
