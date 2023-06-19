clc;
clear all;
load('C:\Users\guota\OneDrive\桌面\NEW\GP.mat')
load('C:\Users\guota\OneDrive\桌面\一阶1000个_区间.mat')
x=env(1:800,1:23);
y=aa_frequence(1:800,1);
xt=env(801:1000,1:23);
yt=aa_frequence(801:1000,1);
train_set=[x,y];
regressionLearner

[yfit,~,yint2]=trainedModel.predictFcn(xt) ;
t=1:length(yt);
plot(t,yt,'r.',t,yfit,'b-');
patch([t';flipud(t')],[yint2(:,1);flipud(yint2(:,2))],'k','FaceAlpha',0.1); % Prediction interval
legend('Observed','Predicted');
RMSE = sqrt(mean((yfit-yt).^2))
