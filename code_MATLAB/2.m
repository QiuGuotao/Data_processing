clc
clear;

x=linspace(0,4*pi,100);

y1=sin(x);
y2=1-cos(x)+x/10;
y3=sin(x)./cos(2*x+5);%�������㣺B.*C ͬ�;����ж�ӦԪ�س˻���B./Cͬ�;����ж�ӦԪ�������B.^n����B��ÿ��Ԫ�ص�n����
                      %�������㣺B/A�ҳ����ұ�Ϊ��������xA=B�Ľ⣬��B*inv(A)��A\B��������Ϊ������Ax=B�Ľ⣬��inv(A)*B

subplot(3,1,1);
plot(x,y1,'-r');
xlabel('X');
ylabel('Y');
legend({'Figure 1'},'FontSize',15);
grid on;

subplot(3,1,2);
plot(x,y2,'sb');
xlabel('X');
ylabel('Y');
legend({'Figure 2'},'FontSize',15);
grid on;

subplot(3,1,3);
plot(x,y3,'*k');
xlabel('X');
ylabel('Y');
legend({'Figure 3'},'FontSize',15);
grid on;

end