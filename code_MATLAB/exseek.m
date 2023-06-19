function [t,px pk vx valley]=exseek(curv,wd,th)

%%输入一维数组和滤波宽度wd(推荐值50)，输出峰值pk和位置px

a=zeros(size(curv));

a(2:end)=diff(curv);

n=length(a)-1;

k=1;j=1;

px=[];pk=[];vx=[];valley=[];t=[];

b=zeros(3*n+1,1);b(1:n)=a(1:end-1);b(n+1:2*n+1)=a;b(2*n+2:end)=a(2:end);

 

for i=(wd+1):(3*n+1-wd)

    temp=b((i-wd):(i+wd));

    if b(i)==max(temp)&&b(i)>th

        pk(k)=b(i);

        px(k)=i;

        k=k+1;

    end

    if b(i)==min(temp)&&b(i)<-th

        valley(j)=b(i);

        vx(j)=i-1;

        j=j+1;

    end

end

 

if ~isempty(px)

    if length(px)==length(vx)

        if px(1)<vx(1)

            t=px/2+vx/2;

        elseif px(1)>vx(1)

            t=px(1:end-1)/2+vx(2:end)/2;

        else

            msgbox('px(1)与vx(1)重合，请检查')

        end

    else

        msgbox('px与vx数目不等，请检查')

    end

end

t=t-n-1;

t(t<n)=[];t(t>2*n+1)=[];

plot(a);hold on

if ~isempty(px)

    for j=1:length(pk)

        plot(px(j),pk(j),'or')

    end

end

if ~isempty(vx)

    for j=1:length(vx)

        plot(vx(j),valley(j),'*g')

        plot(t(j),0,'.r')

    end

end

hold off
