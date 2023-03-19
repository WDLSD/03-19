function [y] = fibonacci(n)

if n < 0
    y = [];
    disp('n不能小于0');
    return;
end
if n == 0 && n == 1
    y = 1;
else
%     y = fibonacci(n-1) + fibonacci(n-2);
    m = [1,1];
    for i = 3:n+1
        m(i) = m(i-1) + m(i-2);
    end
    y = m(n+1);
end
end

