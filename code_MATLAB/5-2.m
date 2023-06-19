clear
Fs=1000;       % ����Ƶ��
T=1/Fs;       % ����ʱ��
L=1000;        % �źų���
t=(0:L-1)*T; % ʱ��
y=normrnd(20,6,[1,1000]);     %�������
figure;
plot(t,y)
title('���������ź�')
xlabel('ʱ��(s)')

N=2^nextpow2(L); %������������������Խ�󣬷ֱ��Ƶ��Խ��ȷ��N>=L�������Ĳ����źŲ�Ϊ0
Y=fft(y,N)/L*2;   %����N����2������ʵ��ֵ��NԽ�󣬷�ֵ����Խ��
f=Fs/N*(0:1:N-1); %Ƶ��
A=abs(Y);     %��ֵ
P=angle(Y);   %��ֵ
R=real(Y);  %ʵ��
I=imag(Y);  %�鲿
figure;


subplot(221);plot(f(1:N/2),A(1:N/2));   %����fft����ֵ�����ݽṹ���жԳ���,�������ֻȡǰһ��

title('��ֵƵ��')
xlabel('Ƶ��(Hz)')
ylabel('��ֵ')


subplot(222);plot(f(1:N/2),P(1:N/2));

title('��λƵ��')
xlabel('Ƶ��(Hz)')
ylabel('��λ')

subplot(223);plot(f(1:N/2),R(1:N/2));

title('ʵ��Ƶ��')
xlabel('Ƶ��(Hz)')
ylabel('ʵ��')

subplot(224);plot(f(1:N/2),I(1:N/2));

title('�鲿Ƶ��')
xlabel('Ƶ��(Hz)')
ylabel('�鲿')