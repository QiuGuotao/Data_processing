data=env_total(1:700,3);%data ����Ļ����������Ǹ�n*1���о���

tau=Mutual_Information_main(data); %����tau�ǹ�һ��Ƕ��ʱ�ӿ��

[FNN] = fnn_deneme(data,tau,10,15,1);
M=find(FNN==0);
if isempty(M)
    m=cao_m(data,1,10,tau);
else    
m=M(1,1);
end

%�����Ƕ��άm

N=length(data);

X=reconstitution(data,N,m,tau);%�ѻ�������data������ռ��ع�

x=X';% x����ռ��ع���Ļ�������