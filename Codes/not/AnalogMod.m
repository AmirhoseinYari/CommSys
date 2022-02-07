function xc = AnalogMod(x1, x2, fs, fc)
Ts = 1/fs;
T = (length(x1)-1)*Ts;
t = 0:Ts:T;
xc = zeros(1,length(t));
xc = x1.*cos(2*pi*fc*t) + x2.*sin(2*pi*fc*t);
end