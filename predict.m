function [mu_,cov_] = predict(x,mu,cov,sigma)
    
    mu_ = (x')*mu;
    cov_ = (x') * cov * x + sigma * sigma;

end