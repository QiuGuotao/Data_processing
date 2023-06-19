clc
clear;

x=0:0.1257:4*pi;

y1=sin(x);
y2=1-cos(x)+x/10;
y3=sin(x)/cos(2*x+5);

subplot(3,1,1);
plot(x,y1,'-r')
legend({'Figure 1'},'FontSize',15);
xlabel('x');
ylabel('y');

subplot(3,1,2);
legend({'Figure 2'},'FontSize',15);
xlabel('x');
ylabel('y');



plot(x,y2,'sg')
subplot(3,1,3);
plot(x,y3,'*k')
legend({'Figure 1'},'FontSize',15);
xlabel('x');
ylabel('y');


hold on
grid on
