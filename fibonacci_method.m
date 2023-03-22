function [alpha_star, iter] = fibonacci_method(a, b, epsilon, maxit)
n = (b - a) / epsilon;
tau = fibonacci(n)/fibonacci(n+1);

a0 = a;
b0 = b;
iter = 0;
alpha0l = a0 + (1 - tau) * (b0 - a0);
alpha0r = a0 + tau * (b0 - a0);
phi0l = phi(alpha0l);
phi0r = phi(alpha0r);
while iter < maxit 
    tau = fibonacci(n-iter)/fibonacci(n-iter+1);
    if phi0l < phi0r
        a1 = a0;
        b1 = alpha0r;
        if (b1 - a1) < epsilon
%             alpha_star = a1 + tau*(b1 - a1);
            % 达到精度时, [a1,b1]中任意一点均可, 一般取中点
            alpha_star = (a1+b1)/2;
            break;
        else
            alpha1l = a1 + (1 - tau) * (b1 - a1);
            alpha1r = alpha0l;
            phi1l = phi(alpha1l);
            phi1r = phi(alpha1r);
        end
    else
        a1 = alpha0l;
        b1 = b0;
        if (b1 - a1) < epsilon
%             alpha_star = a1 + tau*(b1 - a1);
            % 达到精度时, [a1,b1]中任意一点均可, 一般取中点
            alpha_star = (a1+b1)/2;
            break;
        else
            alpha1l = alpha0r;
            alpha1r = a1 + tau * (b1 - a1);
            phi1l = phi(alpha1l);
            phi1r = phi(alpha1r);
        end
    end
    
    a0 = a1;
    b0 = b1;
    alpha0l = alpha1l;
    alpha0r = alpha1r;
    phi0l = phi1l;
    phi0r = phi1r;
    
    iter = iter + 1;
    if iter == maxit
        disp('迭代次数不够');
    end
end

end

