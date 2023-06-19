data=env_total(1:700,3);%data 是你的环境变量，是个n*1的列矩阵

tau=Mutual_Information_main(data); %计算tau是归一化嵌入时延宽度

[FNN] = fnn_deneme(data,tau,10,15,1);
M=find(FNN==0);
if isempty(M)
    m=cao_m(data,1,10,tau);
else    
m=M(1,1);
end

%求最佳嵌入维m

N=length(data);

X=reconstitution(data,N,m,tau);%把环境变量data进行相空间重构

x=X';% x是相空间重构后的环境变量