function regPloygon(x0,y0,R,n)
%�������ã���Բ��Ϊ��x0,y0������һ���뾶ΪR��Բ��������Բ��Ϊ���Ļ�һ��n�ߵ��������,������һ�������ڣ�1��0��
% x0��Բ�ĵĺ����ꣻy0��Բ�ĵ������ꣻR���뾶��n������εı���

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

