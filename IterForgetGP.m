function [mu_, cov] = IterForgetGP(X,Y,sigma,xPredict,RBFParameter,maxMatrixSize)
    persistent K;
    if isempty(K)
        K = GetCovariance(X,RBFParameter);
    end
    persistent sample;
    if isempty(sample)
        sample = X;
    end
    persistent target;
    if isempty(target)
        target = Y;
    end
    
    [num,~] = size(sample);
    Kx = GetMargin(sample,xPredict,RBFParameter);
    L = chol(K + (sigma^2) *eye(num));
    alpha = L' \ (L\target);
    mu_ = Kx' * alpha;
    v = L \ Kx;
    cov = RBF(xPredict,xPredict,RBFParameter) - v'*v;
    if num == maxMatrixSize
        Kx = GetMargin(sample,xPredict,RBFParameter);
        index =( Kx == max(Kx));
        sample(index) = xPredict;
        target(index) = fun(xPredict);
        K = GetCovariance(sample,RBFParameter); 
    else
        K = [K,Kx; Kx',RBF(xPredict,xPredict,RBFParameter) ];
        sample = [sample;xPredict];
        target = [target;fun(xPredict)];
    end
end