function K_ = GetMargin(X,x,sigma)
    [length,~] = size(X);
    K_ = zeros(length,1);
    for i = 1: length
        K_(i) = RBF(X(i),x,sigma);
    end
end