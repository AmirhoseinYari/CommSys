function y = EnvelopeDetector(R, C, x, Ts)
N = length(x);
y = x;
    for i = 2:N
        yrc = y(i-1)*exp(-Ts/R/C);
        if(y(i)<yrc)
            y(i) = yrc;
        end
    end
end