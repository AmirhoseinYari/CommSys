clc
clear all
close all

b = randi([0 1],1,100);
[b1,b2] = Divide(b);

Combine(b1,b2);

Shape = ones(1,10000);
x1 = PulseShaping(b1,Shape,-Shape);
x2 = PulseShaping(b2,Shape,-Shape);

fs = 1000000;
fc = 10000;
xc = AnalogMod(x1, x2, fs, fc);

BW = 1000;
y = Channel(xc, fs, fc, 1000);

[y1, y2] = AnalogDemod(y, fs, BW, fc);

[o1, z1, out1] = MatchedFilt(y1, Shape, -Shape);
[o2, z2, out2] = MatchedFilt(y2, Shape, -Shape);

b_out = Combine(out1,out2);

figure
subplot(2,1,1)
stem(b)
xlim([0 100])
subplot(2,1,2)
stem(b_out)
xlim([0 100])