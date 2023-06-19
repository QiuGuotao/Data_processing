clc;
clear all;
load('C:\Users\guota\OneDrive\×ÀÃæ\env_total.mat');
parameter=3;
lag=3;
k=100;
train_n=1000;
s=env_total_29_4821(1:train_n,parameter);
length_train=length(s);
n=length_train-k-lag;
y=env_total_29_4821(1+lag+k:train_n,parameter);
for t=1:n
    for tt=1:lag+1
        x(t,tt)=s(t+tt-1,1);
    end
end
train_set=[x,y];
regressionLearner

for i=1:k
    for ii=1:lag+1
        xt(i,ii)=s(n+i-1+ii,1);
    end
end
[y_pred,~,yint1]  = trainedModel.predictFcn(xt) ;
y_real=env_total_29_4821(length_train+1:length_train+k,parameter);
length_test=length(y_real);
a=1:length_test;
plot(a,y_real,'r.',a,y_pred,'b-');
patch([a';flipud(a')],[yint1(:,1);flipud(yint1(:,2))],'k','FaceAlpha',0.1); 

RMSE = sqrt(mean(y_pred-y_real).^2)