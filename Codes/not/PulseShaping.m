function x = PulseShaping(b, OneShape, Zeroshape)
N = length(b);
L = length(OneShape);
x = zeros(1,N*L);

for i = 1:1:N
index = 1+L*(i-1);
x(index:1:index+L-1) = b(i)*OneShape + (1-b(i))*Zeroshape;
end

end