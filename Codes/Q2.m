clc
clear all
close all

b = randi([0 1],1,1000);
[b1,b2] = Divide(b);
fprintf('stopped, press Enter');
pause;

Combine(b1,b2);
fprintf('stopped, press Enter');
pause;

Shape = [0 1 3 1 0];
x1 = PulseShaping(b1,Shape,-Shape);
x2 = PulseShaping(b2,Shape,-Shape);
fprintf('stopped, press Enter');
pause;

fs = 1000000;
fc = 10000;
xc = AnalogMod(x1, x2, fs, fc)
fprintf('stopped, press Enter');
pause;

y = Channel(xc, fs, fc, 1000);
