
clear,clc;
close all;

%%��datafile�����ζ�0--7509(0--7509)�ļ������ζ�0--99(3--102)
fileall = dir('F:\DataFile\times_0\*.*');

j = 1;
k = 1;
for i1=3:7509
    fileall(i1,:,:,:,:,:); 
    filesome = dir(['F:\DataFile\times_0\',fileall(i1).name(:)']);
    for i2=3:102
        filesome(i2,:,:,:,:,:);
        a =['F:\DataFile\times_0\',fileall(i1).name,'\',filesome(i2).name];   %a��·��
        trainx =  fopen ( a ,'r');
    
    end
    
end