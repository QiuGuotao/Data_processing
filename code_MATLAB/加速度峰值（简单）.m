max=Pxx2(1,1);
maxi=0;
for i=1:32769
    if(Pxx2(i,1)>max)
        max=Pxx2(i,1);
        maxi=f(i,1);
    end
end


