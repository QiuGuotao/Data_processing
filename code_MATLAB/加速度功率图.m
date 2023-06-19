Fs=100;
n=0:1/Fs:1;
xn=res_signal0(:,4);
nfft=1024;
window=boxcar(100); %矩形窗
window1=hamming(100); %海明窗
window2=blackman(100); %blackman窗
noverlap=20; %数据无重叠
range='half'; %频率间隔为[0 Fs/2]，只计算一半的频率

[Pxx2,f]=pwelch(xn,window2,noverlap,nfft,Fs,range);

semilogy(f,Pxx2); 

ylabel('spectrum[g2/HZ]');
xlabel('f[HZ]');
grid on;