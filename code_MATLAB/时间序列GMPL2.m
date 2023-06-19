clc;
clear all;
load('C:\Users\guota\OneDrive\桌面\env_total.mat');
parameter=3;
s=env_total_29_4821(1:100,parameter);
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

% [hyp, flogtheta0] = gp_initial(bounds, inf, mean, cov, lik, input, target, islog, npop);
[hyp, flogtheta0] = gp_initial([], @infExact, @meanZero, @covSEard, @likGauss, x, y);

% [hyp, flogtheta, i] = trainGParx(hyp, inf, mean, cov, lik, input, target);
[hyp, flogtheta, a] = trainGParx(hyp, @infExact, @meanZero, @covSEard, @likGauss, x, y);

% [ytest S2test] = gp(hyp, inf, mean, cov, lik, input, target, input);
% [mu, s2] = simulGPtaylorSE(hyp, inf, mean, cov, lik, input, target, test, lag);


y_real=env_total_29_4821(101:150,parameter);
length_test=length(y_real);
ss=s;
xs=x;
for i=1:length_test
N=length(xs(:,1));
xt=xs(i:N,:);
[y_pred S2test] = gp(hyp, @infExact, @meanZero, @covSEard, @likGauss, x, y, xt);
ss(length_train+i,1)=y_pred(N-i+1,1);
XR=reconstitution(ss,length_train+i,m,tau);
xs=XR';
end

y_pred=ss(length_train+1:length_train+length_test);
a=1:length_test;
plot(a,y_real,'r.',a,y_pred,'b-');
% patch([a';flipud(a')],[PI(:,1);flipud(PI(:,2))],'k','FaceAlpha',0.1); 

RMSE = sqrt(mean(y_pred-y_real).^2)

