clc;
clear all;
load('C:\Users\guota\OneDrive\桌面\env_total.mat');
parameter=3;
s=env_total_29_4821(1:1000,parameter);
length_train=length(s);
tau=Mutual_Information_main(s); %计算tau是归一化嵌入时延宽度
[FNN] = fnn_deneme(s,tau,20,15,1);
M=find(FNN==0);
if isempty(M)
    m=cao_m(s,1,20,tau);
else    
m=M(1,1);
end
X=reconstitution(s,length_train,m,tau);%把环境变量data进行相空间重构
x=X';% x是相空间重构后的环境变量
y=env_total_29_4821(2+tau*(m-1):length_train+1,parameter);
train_set=[x,y];
regressionLearner

y_real=env_total_29_4821(1001:1024,parameter);
length_test=length(y_real);
ss=s;
for i=1:length_test
N=length(x(:,1));
[yfit,~,yint1]  = trainedModel.predictFcn(x(N,:)) ;

ss(length_train+i,1)=yfit;
XR=reconstitution(ss,length_train+i,m,tau);%把环境变量data进行相空间重构
x=XR';% x是相空间重构后的环境变量
PI(i,:)=yint1;
end

y_pred=ss(length_train+1:length_train+length_test);
a=1:length_test;
plot(a,y_real,'r.',a,y_pred,'b-');
patch([a';flipud(a')],[PI(:,1);flipud(PI(:,2))],'k','FaceAlpha',0.1); 

RMSE = sqrt(mean(y_pred-y_real).^2)