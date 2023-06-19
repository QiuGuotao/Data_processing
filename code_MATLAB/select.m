
clear,clc;
close all;

%%打开datafile，依次读0--7509(0--7509)文件，依次读0--99(3--102)
fileall = dir('F:\DataFile\times_0\*.*');

j = 1;
k = 1;
for i1=3:7509
    fileall(i1,:,:,:,:,:); 
    filesome = dir(['F:\DataFile\times_0\',fileall(i1).name(:)']);
    for i2=3:102
        filesome(i2,:,:,:,:,:);
        a =['F:\DataFile\times_0\',fileall(i1).name,'\',filesome(i2).name];   %a是路径
        trainx =  fopen ( a ,'r');
    
    end
    
end