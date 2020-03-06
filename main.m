clc;
clear all;
close all;

%%
% Initialize

sampleNum = 100;
sampleDim = 1;
sigma = 1;
priorSigma = eye(sampleDim);
interval = 0.01;
dataStart = -2;
dataEnd = 2;
length = (dataEnd - dataStart)/interval + 1;
xx = dataStart:interval:dataEnd;
RBFParameter = .2;

% generated data
% X = 2 * randn(sampleNum,sampleDim);
X = linspace(dataStart,dataEnd,sampleNum)';
Y = zeros(sampleNum,1);
real = zeros(length,1);
predictData = zeros(length,2);
for i = 1:sampleNum
    Y(i) = fun(X(i)) + randn;
end
for i = 1:length
    real(i) = fun(xx(i));
end
% 
% xPredict = X(1);
% for i = 1:length
%     predictData(i,:) = GP(X,Y,sigma,xx(i),RBFParameter);
% end

for i = 1:length
    predictData(i,:) = IterativeGP(X,Y,sigma,xx(i),RBFParameter);
end
% realValue = fun(xPredict)
% mu_
% error = (realValue - mu_)/realValue;
% %train
% [mu, cov] = Train(X,Y,sigma,priorSigma);
% 
% %predict
% for i = 1:length
%     predictData(i,:) = predict(xx(i),mu,cov,sigma);
% end

plot(xx,real,xx,predictData(:,1));
% errorbar(xx,predictData(:,1),predictData(:,2),xx,real,zeros(1,length));
legend('real','predict')
figure
plot(xx,predictData(:,2));
title("cov")
