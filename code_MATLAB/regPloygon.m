function regPloygon(x0,y0,R,n)
%函数作用：在圆心为（x0,y0）处画一个半径为R的圆，并且以圆心为形心画一个n边的正多边形,并且有一个顶点在（1，0）
% x0：圆心的横坐标；y0：圆心的纵坐标；R：半径；n：多边形的边数

a=0:0.01:2*pi;
x=x0+R*cos(a);
y=y0+R*sin(a);
m=2*pi/n;
x1=x0+R*cos(m.*(1:n));
x1=[x1 x1(1)];
y1=y0+R*sin(m.*(1:n));
y1=[y1 y1(1)];
plot(x,y,x1,y1,'g-')
hold on
axis equal
grid on



end

