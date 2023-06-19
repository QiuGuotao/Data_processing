clc
clear;

r=normrnd(10,1,[50,100]);

histogram(r)
hold on
x=5:0.01:15;
y=normpdf(x,10,1);
plot(x,y*1000,'--');
saveas(gcf,'name.fig');

end
