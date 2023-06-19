clc;
clear all;
load('C:\Users\guota\OneDrive\桌面\env_total.mat');
parameter=4;
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
p=m*tau;
y=s(p+1:length_train,1);
for t=1:length_train-p
    for tt=1:p
        x(t,tt)=s(t+tt-1,1);
    end
end
train_set=[x,y];
regressionLearner

y_real=env_total_29_4821(1001:1200,parameter);
ss=s;
length_test=length(y_real);
for i=1:length_test
    for t2=1:p
    xt(1,t2)=ss(length_train-p+i+t2-1,1);
    end
    
[yfit,~,yint1] = trainedModel.predictFcn(xt) ;
ss(length_train+i,1)=yfit;
PI(i,:)=yint1;
end

y_pred=ss(length_train+1:length_train+length_test);
a=1:length_test;
plot(a,y_real,'r.',a,y_pred,'b-');
patch([a';flipud(a')],[PI(:,1);flipud(PI(:,2))],'k','FaceAlpha',0.1); 

RMSE = sqrt(mean(y_pred-y_real).^2)