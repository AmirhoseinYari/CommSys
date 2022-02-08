clc
clear all
close all

%% test
d = [11 2 44 33 222];
b = SourceGenerator(d);
OutputDecoder(b)


%% part 2
fs = 1e6;
TPulse = 10e-3;
fc = 10e3;
BW = 1e3;
Ts = 1/fs;

OneShape = ones(1,TPulse/Ts);
ZeroShape = -OneShape;
sigma = 0:10:200;
%sigma = 0:1:40;
snr = zeros(1,length(sigma));
error = zeros(1,length(sigma));
for j = 1:1:length(sigma)
    j
    N = 100;
    d = randi([0 255],1,N);
    b = SourceGenerator(d);
    [b1, b2] = Divide(b);
    x1 = PulseShaping(b1,OneShape,ZeroShape);
    x2 = PulseShaping(b2,OneShape,ZeroShape);
    xc = AnalogMod(x1,x2,fs,fc);
    y = Channel(xc,fs,fc,BW);
    E = sum(y.^2);
    snr(j) = 20*log10(E/sigma(j)^2);
    y = awgn(y,snr(j),20*log10(E));
    [y1, y2] = AnalogDemod(y,fs,BW,fc);
    [one1, zero1, b1_hat] = MatchedFilt(y1, OneShape, ZeroShape);
    [one2, zero2, b2_hat] = MatchedFilt(y2, OneShape, ZeroShape);
    b_hat = Combine(b1_hat,b2_hat);
    d_hat = OutputDecoder(b_hat);
    error(j) = sum((d_hat-d).^2)/N*100;
end

figure(1)
plot(sigma.^2,error)
title('probability of error over variance :')
ylabel('P Error percent')
xlabel('Variance')