x=env_total_29_4821(1:500,1:16);
yt=f123(1:500,1);
% yy=mapminmax(yt',0,1);
% y=yy';
% x_g=mapminmax(x',0,1);
% xg=x_g';
train_set=[x,yt];

xx=env_total_29_4821(501::700,1:16);
% xx_g=mapminmax(xx',0,1);
% xxg=xx_g';

yyt=f123(501::700,1);
% yreal=mapminmax(yyt',0,1);

regressionLearner

yfit = trainedModel.predictFcn(xx) ;
gprMdl = fitrgp(x,yt,'Basis','purequadratic', 'FitMethod','exact','PredictMethod','exact','kernelfunction','ardsquaredexponential','activesetmethod','likelihood');
[ypred1,~,yint1] = predict(gprMdl,xx);

t=1:500;
plot(t,yyt,'r',t,ypred1,'g',t,yfit,'b')                   % GPR predictions
patch([t';flipud(t')],[yint1(:,1);flipud(yint1(:,2))],'k','FaceAlpha',0.1); % Prediction intervals
title('GPR Fit of Noisy Observations')
legend({'Noisy observations','g(x) = x*sin(x)','GPR predictions','95% prediction intervals'},'Location','best')