clc
clear;
fs=100;%(����������ʱ������ȱ��)
x=normrnd(20,6,[1000,1]);%���������һ��1000����̬�ֲ���������ֵΪ20������Ϊ6��
X=fft(x);%����1000�������ɵľ��������ٸ���Ҷ�任��������ϸ�� doc fft�����ɵ�X�Ǹ�����������ʵ�������鲿��
X(1)=[];%��Ϊ�˻�ͼ��ɾ���洢�����ܺ͵�����ĵ�һ��Ԫ�أ�����԰�����ȥ�����ԣ�
%f=(0:length(X)-1)'*fs/length(X);���ȱ�ܣ�

r=real(X);%��ȡX��ʵ�����֣�
i=imag(X);%��ȡX���鲿���֣�
m=abs(X);%��ȡ�����ķ�ֵ������Կ������������£���ԭ��ľ��룬����a+bi����ֵ����a��ƽ����b��ƽ����
p=angle(X)*(180/pi);%��ȡ��������λ�����������£������㵽ԭ������ߵĽǶȣ�angle����������ǽǶ�ֵ��?180/pi�����ɽǶ�ֵ��


subplot(3,2,1);
stem(r);
title('real part');
xlabel('f[Hz]');
 

subplot(3,2,2);
stem(i);
title('imaginary part');
xlabel('f[Hz]'); 

subplot(3,2,3);
stem(m);
title('magnitude part');
xlabel('f[Hz]'); 

subplot(3,2,4);
stem(p);
title('phase part');
xlabel('f[Hz]');


subplot(3,2,5);
cpsd(X,X);%��������������������ף������Թ����ף�
title('auto power spectral density');
