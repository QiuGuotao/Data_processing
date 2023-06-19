Amg=A/(239/15.9);
y=Amg(2600:12237,2);
x=1:length(y);
x=x';
train_set=[x,y];
regressionLearner

xt=9638:10000;
xt=xt';

[yfit,~,yint2]=trainedModel.predictFcn(xt) ;

y(9638:10000,1)=yfit;
plot(1:10000,y);


