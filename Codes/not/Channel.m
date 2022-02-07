function out = Channel( input , Fs ,Fc ,Bw)
    num = length( input );
    fft_signal = fftshift (fft(input));
    F = -Fs/2 : Fs/num : Fs/2 - Fs/num;
    out_fft = zeros(1,length(fft_signal));
    min2 = floor((Fc-Bw/2+Fs/2)/(Fs/num));
    max2 = floor((Fc+Bw/2+Fs/2)/(Fs/num));
    min1 = floor((-Fc-Bw/2+Fs/2)/(Fs/num));
    max1 = floor(-Fc+Bw/2+Fs/2)/(Fs/num);
    for i = min1-100:1:max1+100
        if abs(F(i)-Fc)<=Bw/2
            
            out_fft(i) = fft_signal(i);
        
        elseif abs(F(i)+Fc)<=Bw/2
            out_fft(i) = fft_signal(i);
        else
            out_fft(i) = 0; 
        end
    end
    for i = min2-100:1:max2+100
        if abs(F(i)-Fc)<=Bw/2
            
            out_fft(i) = fft_signal(i);
        
        elseif abs(F(i)+Fc)<=Bw/2
            out_fft(i) = fft_signal(i);
        else
            out_fft(i) = 0; 
        end
    end
    out  = ifft(ifftshift(out_fft));
end