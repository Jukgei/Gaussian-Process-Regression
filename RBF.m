function k = RBF(x1,x2,sigma)
    norm2 = norm(x1-x2,2);
    
    k = exp( -norm2 / (sigma ^2));
end