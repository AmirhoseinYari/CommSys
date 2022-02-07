function [cor_one,cor_zero,out]=MatchedFilt(input,one,zero)
psd_one = one.*one;
Energy=sum(psd_one);
cor_one=conv(input,one);
cor_zero=conv(input,zero);
out=zeros(1,length(input)/length(zero));
for i=1:length(out)
    if cor_one(i*length(zero))>=Energy/2
        out(i)=1;
    end
end
end