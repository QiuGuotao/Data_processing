clear
Fs=1000;       % 采样频率
T=1/Fs;       % 采样时间
L=1000;        % 信号长度
t=(0:L-1)*T; % 时间
y=normrnd(20,6,[1,1000]);     %添加噪声
figure;
plot(t,y)
title('加噪声的信号')
xlabel('时间(s)')

N=2^nextpow2(L); %采样点数，采样点数越大，分辨的频率越精确，N>=L，超出的部分信号补为0
Y=fft(y,N)/L*2;   %除以N乘以2才是真实幅值，N越大，幅值精度越高
f=Fs/N*(0:1:N-1); %频率
A=abs(Y);     %幅值
P=angle(Y);   %相值
R=real(Y);  %实部
I=imag(Y);  %虚部
figure;


subplot(221);plot(f(1:N/2),A(1:N/2));   %函数fft返回值的数据结构具有对称性,因此我们只取前一半

title('幅值频谱')
xlabel('频率(Hz)')
ylabel('幅值')


subplot(222);plot(f(1:N/2),P(1:N/2));

title('相位频谱')
xlabel('频率(Hz)')
ylabel('相位')

subplot(223);plot(f(1:N/2),R(1:N/2));

title('实部频谱')
xlabel('频率(Hz)')
ylabel('实部')

subplot(224);plot(f(1:N/2),I(1:N/2));

title('虚部频谱')
xlabel('频率(Hz)')
ylabel('虚部')