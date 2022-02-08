function [oneMatch, zeroMatch, b] = MatchedFilt(y, OneShape, ZeroShape)
zeroMatch = conv(y,flip(ZeroShape));
oneMatch = conv(y,flip(OneShape));
N = length(y);
L = length(OneShape);
b = zeros(1,N/L);
for i = 1:1:length(b)
    if oneMatch(i*L)>0
        b(i) = 1;
    end
end
end