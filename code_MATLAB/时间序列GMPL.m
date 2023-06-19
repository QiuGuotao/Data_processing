clc;
clear all;
load('C:\Users\guota\OneDrive\×ÀÃæ\env_total.mat');
parameter=3;
s=env_total_29_4821(1:500,parameter);

% [in, t] = construct(lag, u, y, uind, yind);
lag=7;
[in, t] = construct(lag, s,s);
train=in(:,1:lag);

% [hyp, flogtheta0] = gp_initial(bounds, inf, mean, cov, lik, input, target, islog, npop);
[hyp, flogtheta0] = gp_initial([], @infExact, @meanZero, @covSEard, @likGauss, train, t);

% [hyp, flogtheta, i] = trainGParx(hyp, inf, mean, cov, lik, input, target);
[hyp, flogtheta, i] = trainGParx(hyp, @infExact, @meanZero, @covSEard, @likGauss, train, t);

% [ytest S2test] = gp(hyp, inf, mean, cov, lik, input, target, input);
% [mu, s2] = simulGPtaylorSE(hyp, inf, mean, cov, lik, input, target, test, lag);

ss=s;
for ii=1:100
    [ins, ts] = construct(lag, ss,ss);
    p=ins(length(ss)-lag,1:lag);
    
    [ytest, S2test] = gp(hyp, @infExact, @meanZero, @covSEard, @likGauss, train, t,p);
    ss(length(s)+ii,1)=ytest;
end
% [mu, s2] = simulGPtaylorSE(hyp, @infExact, @meanZero, @covSEard, @likGauss, in, t,test,lag);
 yreal=env_total_29_4821(501:600,parameter);
 ypred=ss(501:600,1);
 plot(1:100,yreal,'r.',1:100,ypred,'b-')