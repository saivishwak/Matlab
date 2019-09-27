%Random Number Generation - Linear Congrugent Method
%The random points are geneted in the inter [0,1]
%If the range is to be changed interpolation can be used to change the interval
%n is the number of points
function random = Random(n)
%Input
a = 25214903917;            % Constant Parameter
c = 11;                     % Constant Parameter
m = 2^31;                   % Constant Parameter
r = zeros(n,1);
r(1) = 10;
v = zeros(n,1);
v(1) = 1;
%Main Loop
for i = 2:n
    r(i) = mod((a*r(i-1)+c),abs(m));
    random = r./m;
    v(i)= v(i-1)+1;
end
%Plot
scatter(random,v,'filled');