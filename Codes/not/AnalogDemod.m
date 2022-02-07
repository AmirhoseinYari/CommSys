function [x1,x2]=AnalogDemod(input,Fs,Bw,Fc)
t=1/Fs:1/Fs:(length(input)*1/Fs);
Cos_vec = cos(2*pi*Fc*t);
Sin_vec = sin(2*pi*Fc*t);
x1=2*input.*Cos_vec;
x2=2*input.*Sin_vec ;
X1=fftshift(fft(x1));
X2=fftshift(fft(x2));
F=linspace(0,Fs,length(X1))-Fs/2;
min = floor(((Fs/2)-(Bw/2))/(Fs/length(X1)));
max = floor(((Fs/2)+(Bw/2))/(Fs/length(X1)));
out1 = zeros(1,length(X1));
out2 = zeros(1,length(X1));
for i=min-100:1:max+100
   if(abs(F(i))<Bw)
       out1(i)=X1(i);
       out2(i)=X2(i);
   end
end
x1=ifft(ifftshift(out1));
x2=ifft(ifftshift(out2));
end