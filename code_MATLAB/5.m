clc
clear;
fs=100;%(这里你理解的时候可以先别管)
x=normrnd(20,6,[1000,1]);%（随机生成一个1000个正态分布的数，均值为20，方差为6）
X=fft(x);%（对1000个数构成的矩阵做快速傅里叶变换，建议仔细看 doc fft，生成的X是个复数矩阵，有实部，有虚部）
X(1)=[];%（为了画图，删除存储数据总和的输出的第一个元素，你可以把这行去掉试试）
%f=(0:length(X)-1)'*fs/length(X);（先别管）

r=real(X);%（取X的实部部分）
i=imag(X);%（取X的虚部部分）
m=abs(X);%（取复数的幅值，你可以看作复数坐标下，到原点的距离，例如a+bi，幅值就是a的平方加b的平方）
p=angle(X)*(180/pi);%（取复数的相位，复数坐标下，复数点到原点的连线的角度，angle（）输出的是角度值，?180/pi，换成角度值）


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
cpsd(X,X);%（自身和自身做互功率谱，就是自功率谱）
title('auto power spectral density');
