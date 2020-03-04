clc;
clear;
close all;

%%
% Initialize

sampleNum = 10;
sampleDim = 1;
sigma = 0.2;
priorSigma = eye(sampleDim);
interval = 0.01;
dataStart = -2;
dataEnd = 2;
length = (dataEnd - dataStart)/interval + 1;
xx = dataStart:interval:dataEnd;

% generated data
X = 10 * randn(sampleNum,sampleDim);
Y = zeros(sampleNum,1);
real = zeros(length,1);
predictData = zeros(length,2);
for i = 1:sampleNum
    Y(i) = fun(X(i));
end
for i = 1:length
    real(i) = fun(xx(i));
end

%train
[mu, cov] = Train(X,Y,sigma,priorSigma);

%predict
for i = 1:length
    predictData(i,:) = predict(xx(i),mu,cov,sigma);
end

plot(xx,real,xx,predictData(:,1));

