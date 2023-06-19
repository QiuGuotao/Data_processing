clear;
clc;
close all hidden;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fno = 'output.txt';
fid = fopen('1.txt','r');
x = fscanf(fid,'%f',[1,inf]);
status = fclose(fid); 
sf = 1000; %����Ƶ��
fmin = 1;           %��С��ֹƵ��
fmax = 200;           %����ֹƵ��
c = 9810.5;           %��λ�任ϵ��
it = 2;               %���ִ��� 
sx = 'ʱ��';          %�������ע
sy1 = 'y1';           %�������ע
sy2 = 'y2';           %�������ע 
n=length(x);                    %���������鳤��
t=0:1/sf:(n-1)/sf;              %����ʱ������
nfft=2^nextpow2(n);             %���ڲ��ӽ�n��2���ݴη���FFT����
y=fft(x,nfft);                  %FFT�任 
df=sf/nfft;                     %����Ƶ�ʼ��
(Hz/s)ni=round(fmin/df+0.5);          %��ͨƵ�ʽ�ֹ��=��С��ֹƵ��/ʱ�䲽��
t+1na=round(fmax/df+0.5);          %��ͨƵ�ʽ�ֹ��=����ֹƵ��/ʱ�䲽��
t+1dw=2*pi*df;                     %ԲƵ�ʼ��
(rad/s)w1=0:dw:2*pi*(0.5*sf-df);       %����ɢԲƵ������
w2=-2*pi*(0.5*sf-df):dw:-dw;    %����ɢԲƵ������
w=[w1,w2];                      %����w1,w2
w=w.^it;                        %�Ի��ִ���Ϊָ��������ԲƵ�ʱ�������
subplot(2,2,2);
plot(abs(y)); 
a=zeros(1,nfft);                %���л��ֵ�Ƶ��任
a(2:nfft-1)=y(2:nfft-1)./w(2:nfft-1);
subplot(2,2,4);                 %���ƻ���ǰ��ʱ������ͼ��
plot(abs(a)); 
if it==2    
    y=-a;                       %���ж��λ��ֵ���λ�任
else
    y = imag(a) - 1i*real(a);   %����һ�λ��ֵ���λ�任
end
a=zeros(1,na);                  
a(ni:na)=y(ni:na);              %����ָ����Ƶ�����Ƶ�ʳɷ�
a(nfft-na+1:nfft-ni+1)=y(nfft-na+1:nfft-ni+1);%����ָ����Ƶ�����Ƶ�ʳɷ� 
y=ifft(a,nfft);                 %IFFT�任
y=real(y(1:n))*c;               %ȡ��任��ʵ��n��Ԫ�ز����Ե�λ�任ϵ��Ϊ���ֽ��
subplot(2,2,1);                 %���ƻ���ǰ��ʱ������ͼ��
plot(t,x);
xlabel('ʱ��(s)');
ylabel('���ٶ�(g)');
grid on;
subplot(2,2,3);                 %���ƻ���ǰ��ʱ������ͼ��
plot(t,y);
xlabel('ʱ��(s)');
if it==2    
    ylabel('����(m)');
else
    ylabel('�ٶ�(m/s)');
end grid on;
    fid=fopen(fno,'w');             %������ֺ������
    for k=1:n	
        fprintf(fid,'%f/n',y(k));
    end
    status=fclose(fid);
