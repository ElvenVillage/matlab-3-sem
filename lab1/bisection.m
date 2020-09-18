function [x, k] = bisection(left, right, fun, eps)
%Метод половинного деления
    a = left;
    b = right;
    k = 0;
    while abs(a - b) > eps
        x = (a + b) / 2;
        k = k + 1;
        if fun(a)*fun(x) < 0
            b = x;
        else
            a = x;
        end
    end
end

