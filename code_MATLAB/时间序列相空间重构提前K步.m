clc;
clear all;
load('C:\Users\guota\OneDrive\×ÀÃæ\env_total.mat');
parameter=13;
k=100;
train_n=2000;
for kk=1:k
s=env_total_29_4821(1:train_n,parameter);
length_train=length(s);
tau=Mutual_Information_main(s); 
[FNN] = fnn_deneme(s,tau,20,15,1);
M=find(FNN==0);
if isempty(M)
    m=cao_m(s,1,20,tau);
else    
m=M(1,1);
end
X=reconstitution(s,length_train,m,tau);
xr=X';
yn=tau*(m-1)+k;
y=env_total_29_4821(1+yn:train_n,parameter);
xn=length(y);
x=xr(1:xn,:);
% train_set=[x,y];
% regressionLearner
% 
rng default
gprMdl = fitrgp(x,y,'fitmethod','sr',  ...
                    'basisfunction','purequadratic', ...
                    'standardize',1, ...
                    'computationmethod','qr', ...
                    'kernelfunction','ardsquaredexponential');



%%%%%%%%%%%%%%%%%%%%%%%
xt=xr(xn+1:length(xr),:);
% [y_pred,~,yint1]=trainedModel.predictFcn(xt) ;
[y_pred,~,yint1] = predict(gprMdl,xt);
y_real=env_total_29_4821(1+length_train:length_train+k,parameter);
length_test=length(y_real);
a=1:length_test;
plot(a,y_real,'r.',a,y_pred,'b-');
patch([a';flipud(a')],[yint1(:,1);flipud(yint1(:,2))],'k','FaceAlpha',0.1); 

RMSE = sqrt(mean(y_pred-y_real).^2)