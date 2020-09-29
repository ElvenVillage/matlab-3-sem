function [x, k] = fixed_point(x0, g, eps, q)
%Метод простых итераций
    x1 = x0;
    x = g(x0);
    k = 0;
    while abs(x - x1) > ((1-q)/q) * eps
        x1 = x;
        x = g(x1);
        k = k + 1;
    end
end

