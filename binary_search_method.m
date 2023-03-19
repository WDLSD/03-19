function [c, iter] = binary_search_method(a, b, epsilon, maxit)
iter = 0;
while iter < maxit && abs(b - a) > epsilon 
    c = (a + b) / 2;
    if dphi(c) > 0
        b = c;
    elseif dphi(c) < 0
        a = c;
    elseif dphi(c) == 0
        break;
    end
    iter = iter + 1;
end
end

