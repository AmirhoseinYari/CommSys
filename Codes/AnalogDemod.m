function [y1, y2] = AnalogDemod(xc, fs, BW, fc)
Ts = 1/fs;
N = length(xc);
t = 0:Ts:(N-1)*Ts;
y1 = xc.*cos(2*pi*fc*t);
y2 = xc.*sin(2*pi*fc*t);

y1 = lowpass(y1, BW, fs, 'Steepness',0.99);
y2 = lowpass(y2, BW, fs, 'Steepness',0.99);
end