clc
clear all
close all

fs = 1e6;
TPulse = 10e-3;
fc = 10e3;
BW = 1e3;

Ts = 1/fs;
OneShape = ones(1,TPulse/Ts);
ZeroShape = -OneShape;

b = randi([0 1],1,1000);
