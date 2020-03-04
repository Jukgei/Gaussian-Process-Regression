function [mu,cov] = Train(X,Y,sigma,priorSigma)

    A = sigma ^(-2)  * (X') * X + priorSigma;
    cov = inv(A);
    mu = sigma ^(-2)*A\(X')*Y;
end