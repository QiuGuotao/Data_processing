clc
clear;
%%题干信息
mu = [0.2 0.5];%X和Y的均值
sigma = [2 3 ; 3 5];%X和Y的协方差矩阵

%%计算边缘概率密度函数
x=normpdf(X,0.2,2^0.5);%二维高斯分布的边缘概率密度函数是一维正态分布，方差和均值根据mu和sigma计算
y=normpdf(Y,0.5,5^0.5);

%%作图
[a b]=meshgrid(linspace(-10,10,100)',linspace(-10,10,100)');
A=[a(:) b(:)];
z=mvnpdf(A,mu,sigma);
res=reshape(z,100,100);
subplot(211)
surf(a,b,res);
subplot(212)
contour(a,b,res);
colormap(subplot(211),hot)
colormap(subplot(212),hot)


%%生成1000次的随机数
for i=1:1000
r = mvnrnd(mu,sigma,100);
c(:,2*i-1)=r(:,1);
c(:,2*i)=r(:,2);

end

