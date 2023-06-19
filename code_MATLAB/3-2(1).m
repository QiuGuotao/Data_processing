clc
n=input('n=')
theta1=0:0.01:2*pi;
x0=0;
y0=0;
R=1
x=x0+R*cos(theta1);
y=y0+R*sin(theta1);
n=n+1;
theta=linspace(0,2*pi,n);
plot(x,y,cos(theta),sin(theta),'g-')
hold on
grid on
axis square