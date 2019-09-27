function dot_product = dotpro(v1,v2)
dot_product = 0;
for i = 1:length(v1)
    dot_product = dot_product+v1(i)*v2(i);
end
end