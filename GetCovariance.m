function K = GetCovariance(X,sigma)
    [num,~] = size(X);
    K = zeros(num,num);
    for i = 1:num
        for j = i:num
            K(i,j) = RBF(X(i),X(j),sigma);
            K(j,i) = K(i,j);
        end
    end
end