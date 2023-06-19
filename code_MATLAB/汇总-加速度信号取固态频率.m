%% 提取加速度文件
maindir0=uigetdir('*.*','Select SPS or DGNSS File Folders');
subpath0=fullfile(maindir0,'*.aaa');
textfiles0=dir(subpath0);
num_re0=size(textfiles0,1);
for kk0=1:num_re0-1
textname0=textfiles0(kk0,1).name; 
fid0=fopen(textname0,'r');
signal_cell0=textscan(fid0,'%s');
signal_acc0=signal_cell0{1,1}(4:65536+3,1);
res_signal0(:,kk0)=str2num(char(signal_acc0));  
fclose(fid0);  
end 
%% 互功率谱矩阵以及自功率谱计算
Fs=100;
n=0:1/Fs:1;
nfft=1024;
Nd=length(res_signal0(1,:));
channel = [1:Nd];  
G0 = zeros(length(channel),length(channel),(nfft/2+1));   
G1=0;              

for i=1:length(channel) 
    for j=1:length(channel) 

        [Pff2,f_disc]=cpsd(res_signal0(:,channel(i)),res_signal0(:,channel(j)),kaiser(nfft),nfft/2,nfft,Fs);
      
        G0(j,i,:) = Pff2; 
            if i==j 
            G1=G1+Pff2; 
        end 
 end 
end
%% 互功率谱矩阵奇异值计算
for k=1:length(G0(1,1,:))
    s(:,:,k)=svd(G0(:,:,k));
    QYZ(k,1)=s(1,1,k);
end
%% 做互功率谱矩阵图以及自功率谱图
subplot(2,1,1);
semilogy(f_disc,QYZ);
ylabel('spectrum[g2/HZ]');
xlabel('f[HZ]');
grid on;
subplot(2,1,2);
semilogy(f_disc,G1);
ylabel('spectrum[g2/HZ]');
xlabel('f[HZ]');
grid on;