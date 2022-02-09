function b = SourceEncoder(n,x)
b = [];
for i = 1:1:n
    if x(i)=='a'
        b = [b,1];
    elseif x(i) == 'b'
        b = [b,0,1];
    elseif x(i) == 'c'
        b = [b,1,1,1];
    elseif x(i) == 'd'
        b = [b,0,0,1,1];
    elseif x(i)=='e'
        b = [b,0,0,0,0,1];
    else
        b = [b,0,0,0,1,1];
    end
end
end