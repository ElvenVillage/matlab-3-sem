f_a = @(x) 3*x^4 + 4*x^3 + 12*x^2 - 5;
f_b = @(x) log(x) + (x+1).^3;

%g_a = @(x) x - (3*x^3 + 4*x^3 + 12*x^2 - 5) / 20;
%g_a = @(x) nthroot(4-8*x+5*x^2, 3);
g_a = @(x) sqrt(5/(3*x^2 +4*x + 12));
g_b = @(x) exp(-(x+1)^3);

eps = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9];
X = linspace(1, 9, 9);
ya1 = 0; ya2 = 0;
yb1 = 0; yb2 = 0;


%Решение уравнения f_a(x) = 0 методом простых итераций
figure;
plot_a_x = linspace(0.1, 0.7, 500);
plot_a_y_2 = zeros(500, 1);
for i = 1:500
    [ax, ak] = fixed_point(plot_a_x(i), g_a, eps(8), 0.06);
    plot_a_y_2(i) = ak;
end
ya2 = ax
plot(plot_a_x, plot_a_y_2)
title('Зависимость кол-ва итераций от начального приближения {x_{0}} для алгебраического уравнения')
xlabel('{x_{0}}')
ylabel('N')


%Решение уравнения f_b(x) = 0 методом простых итераций
figure;
plot_b_x = linspace(0.01, 0.5, 500);
plot_b_y_2 = zeros(500, 1);
for i = 1:500
    [bx, bk] = fixed_point(plot_b_x(i), g_b, eps(8), 0.95);
    plot_b_y_2(i) = bk;
end
yb2 = bx
plot(plot_b_x, plot_b_y_2)
title('Зависимость кол-ва итераций от начального приближения {x_{0}} для трансцендентного уравнения')
xlabel('{x_{0}}')
ylabel('N')