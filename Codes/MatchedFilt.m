function [oneMatch, zeroMatch, b] = MatchedFilt(y, OneShape, ZeroShape)
zeroMatch = conv(y,ZeroShape);
oneMatch = conv(y,OneShape);
N = length(y);
L = length(OneShape);
b = zeros(1,N/L);
E = sum(OneShape.*OneShape)*0;
for i = 1:1:length(b)
    if oneMatch(i*L)>=E/2
        b(i) = 1;
    end
end
end