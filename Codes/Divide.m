function [b1, b2] = Divide(b)
N = length(b);
b1 = b(1:2:N-1);
b2 = b(2:2:N);
end