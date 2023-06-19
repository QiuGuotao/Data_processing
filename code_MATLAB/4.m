clc
clear;
%%�����Ϣ
mu = [0.2 0.5];%X��Y�ľ�ֵ
sigma = [2 3 ; 3 5];%X��Y��Э�������

%%�����Ե�����ܶȺ���
x=normpdf(X,0.2,2^0.5);%��ά��˹�ֲ��ı�Ե�����ܶȺ�����һά��̬�ֲ�������;�ֵ����mu��sigma����
y=normpdf(Y,0.5,5^0.5);

%%��ͼ
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


%%����1000�ε������
for i=1:1000
r = mvnrnd(mu,sigma,100);
c(:,2*i-1)=r(:,1);
c(:,2*i)=r(:,2);

end

