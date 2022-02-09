function x = InformationSource(n)
r = randi(32,1,n);
x = [];
for i = 1:1:n
    if r(i)<16
        x = [x,'a'];
    elseif r(i)<24
        x = [x,'b'];
    elseif r(i)<28
        x = [x,'c'];
    elseif r(i)<30
        x = [x,'d'];
    elseif r(i)<31
        x = [x,'e'];
    else
        x = [x,'f'];
    end
end
end