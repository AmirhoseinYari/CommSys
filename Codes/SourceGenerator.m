function b = SourceGenerator(d)
N = length(d);
b = [];
for i = 1:1:N
    b = [b,flip(de2bi(d(i),8))];
end
end