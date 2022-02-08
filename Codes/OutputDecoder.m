function d = OutputDecoder(b)
N = length(b);
d = [];
for i = 1:8:N
   d = [d,bi2de(b(i:1:i+7),'left-msb')];
end
end