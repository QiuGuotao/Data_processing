clc
clear;

x=linspace(0,4*pi,100);

y1=sin(x);
y2=1-cos(x)+x/10;
y3=sin(x)./cos(2*x+5);%数组运算：B.*C 同型矩阵中对应元素乘积；B./C同型矩阵中对应元素相除；B.^n矩阵B中每个元素的n次幂
                      %矩阵运算：B/A右除，右边为除数，即xA=B的解，即B*inv(A)；A\B左除，左边为除数，Ax=B的解，即inv(A)*B

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