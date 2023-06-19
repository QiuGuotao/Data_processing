clc;
clear all;
load('C:\Users\guota\OneDrive\桌面\NEW\GP.mat')
load('C:\Users\guota\OneDrive\桌面\一阶1000个_区间.mat')
x=env(1:800,1:23);
y=aa_frequence(1:800,1);
xt=env(801:1000,1:23);
yt=aa_frequence(801:1000,1);
sigma0 = 0.2;
kparams0 = [3.5, 6.2];
rng default
gprMdl = fitrgp(x,y,'fitmethod','sr',  ...
                    'basisfunction','purequadratic', ...
                    'standardize',1, ...
                    'computationmethod','qr', ...
                    'kernelfunction','ardsquaredexponential', ...
                    'kernelParameters',kparams0,'Sigma',sigma0, ...
                    'activesetmethod','likelihood', ...
                    'predictmethod','exact');
%                   'optimizer','fminsearch');
%                    'optimizehyperparameter','all');
                
[ypred1,~,yint1] = predict(gprMdl,xt);
t=1:length(yt);
plot(t,yt,'r.',t,ypred1,'g-');
legend('Observed','Predicted');
patch([t';flipud(t')],[yint1(:,1);flipud(yint1(:,2))],'k','FaceAlpha',0.1); % Prediction interval
RMSE = sqrt(mean((ypred1-yt).^2))
