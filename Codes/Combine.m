function b = Combine(b1,b2)
N = length(b1)+length(b2);
b(1:2:N-1) = b1;
b(2:2:N) = b2;
end