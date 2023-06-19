clc
clear;

r=normrnd(10,1,[50,100]);%50*100个数,mean value equal to 10 and standard deviation equal to 1.
histogram(r)%直方图
hold on %Retain current plot when adding new plot
x=5:0.01:15;
y=normpdf(x,10,1);%正态概率密度函数,with mean=10 and std=1 ,以x值评估
plot(x,y,'--');% *1000为什么？
saveas(gcf,'name.fig');
