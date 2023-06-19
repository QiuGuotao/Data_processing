Fs=100;
n=0:1/Fs:1;
xn=res_signal0(:,4);
nfft=1024;
window=boxcar(100); %���δ�
window1=hamming(100); %������
window2=blackman(100); %blackman��
noverlap=20; %�������ص�
range='half'; %Ƶ�ʼ��Ϊ[0 Fs/2]��ֻ����һ���Ƶ��

[Pxx2,f]=pwelch(xn,window2,noverlap,nfft,Fs,range);

semilogy(f,Pxx2); 

ylabel('spectrum[g2/HZ]');
xlabel('f[HZ]');
grid on;