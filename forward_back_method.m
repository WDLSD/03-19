function [a, b, iter] = forward_back_method(alpha0, gamma0, t, maxit)
phi0 = phi(alpha0);
iter = 0;
while iter < maxit
    alpha1 = alpha0 + gamma0;
    phi1 = phi(alpha1);
    if phi1 < phi0
        gamma1 = t*gamma0;
        alpha = alpha0;
    elseif phi1 >= phi0
        if iter == 0
            gamma1 = -gamma0;
            alpha = alpha1;
            alpha1 = alpha0;
            phi1 = phi0;
        elseif iter >= 1
            a = min(alpha,alpha1);
            b = max(alpha,alpha1);
            break;
        end
    end
    alpha0 = alpha1;
    gamma0 = gamma1;
    phi0 = phi1;
    iter = iter + 1;
    if iter == maxit
        disp('迭代次数不够');
        a = [];
        b = [];
    end
end
end

