[pks,locs] = findpeaks(Pxx2);
GYPL=[1,4];
for i=1:4
    GYPL(1,i)=locs(i,1)/32769*50;
end
clc
clear