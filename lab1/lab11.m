f_a = @(x) 3*x.^4 + 4*x.^3 + 12*x.^2 - 5;
f_b = @(x) log(x) + (x+1)^3;

g_a = @(x) sqrt(5/(3*x^2 +4*x + 12));
g_b = @(x) exp(-(x+1)^3);

g_a_derive = @(x) (3.*x+2)./(sqrt((3*x.^2+4.*x+12).^3));

eps = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9];
X = linspace(-1, 1, 500);
figure
plot(X, f_a(X))
title('Рис. 2 График функции f(x)')
xlabel('x')
ylabel('y')

figure
X = linspace(0, 2.136, 500);
X1 = linspace(0.1, 1, 500);
plot(X, g_a_derive(X))
title('Рис. 3 График \phi (x)')
ya1 = 0; ya2 = 0;
yb1 = 0; yb2 = 0;

figure
hold on
% Решение уравнения f_a(x) = 0 методом половинного деления
plot_a_y = zeros(9,1);
for i = 1:9
    [ax, ak] = bisection(0, 2.136, f_a, eps(i));
    plot_a_y(i) = ak;
end
ya1 = ax

plot(plot_a_y, '-ko')
% 
% Решение уравнения f_b(x) = 0 методом половинного деления
plot_b_y = zeros(9,1);
for i = 1:9
    [bx, bk] = bisection(0.1, 1, f_b, eps(i));
    plot_b_y(i) = bk;
end
yb1 = bx
plot(plot_b_y, '-bo')

% Решение уравнения f_a(x) = 0 методом простых итераций
plot_a_y2 = zeros(9,1);
for i = 1:9
    [ax, ak] = fixed_point(2.136, g_a, eps(i), 0.06);
    plot_a_y2(i) = ak;
end
ya2 = ax
plot(plot_a_y2, '-go')

% Решение уравнения f_b(x) = 0 методом простых итераций
plot_b_y2 = zeros(9,1);
for i = 1:9
    [bx, bk] = fixed_point(0.5, g_b, eps(i), 0.95);
    plot_b_y2(i) = bk;
end
yb2 = bx
plot(plot_b_y2, '-ro')

title('Рис.1 Зависимость кол-ва итераций от порядка точности \epsilon')
xlabel('\epsilon, {10^{-x}}')
ylabel('N')
legend({'Половинного деления a(x) = 0', ...
   'Половинного деления b(x) = 0', ...
   'Простых итераций a(x) = 0', ...
  'Простых итераций b(x) = 0'
   },'Location','northwest')
