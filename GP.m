function [mu_, cov ] = GP(X,Y,sigma,xPredict,RBFParameter)
    K = GetCovariance(X,RBFParameter);
    Kx = GetMargin(X,xPredict,RBFParameter);
    [num,~] = size(K);
    L = chol(K + (sigma^2) *eye(num));
    alpha = L' \ (L\Y);
    mu_ = Kx' * alpha;
    v = L \ Kx;
    cov = RBF(xPredict,xPredict,RBFParameter) - v'*v;
    
end