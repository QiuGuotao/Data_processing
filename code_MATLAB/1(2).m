clc
clear;

r=normrnd(10,1,[50,100]);%50*100����,mean value equal to 10 and standard deviation equal to 1.
histogram(r)%ֱ��ͼ
hold on %Retain current plot when adding new plot
x=5:0.01:15;
y=normpdf(x,10,1);%��̬�����ܶȺ���,with mean=10 and std=1 ,��xֵ����
plot(x,y,'--');% *1000Ϊʲô��
saveas(gcf,'name.fig');
