%Часть 1
iterations = 100;
errors = zeros(iterations, 1);
condition_numbers = zeros(iterations, 1);
c = 10;
n = 10;

for i = 1:iterations
    A = matrix_with_cond(n, c);
    x = rand(n, 1) * randi(20);
    b = A*x;
     
    x_solv = gauss_elimination_by_row(A, b);
    
    errors(i) = norm(x - x_solv);
    condition_numbers(i) = c;
    
    c = 10*(i+1);
end

figure
semilogy(condition_numbers, errors, '-')
grid on
title('Зависимость нормы разности точного и вычисленного решения от числа обусловленности матрицы')

%Часть 2
iterations2 = 100;

A1 = matrix_with_cond(n, 5);
x1 = rand(n, 1) * randi(20);
b1 = A1 * x1;

errors1 = zeros(iterations2, 1);

A2 = matrix_with_cond(n, 20);
%A2 = hilb(n);
x2 = rand(n, 1) * randi(20);
b2 = A2 * x2;

per = zeros(iterations2, 1);

errors2 = zeros(iterations2, 1);

b11 = zeros(iterations2, n);
for i = 1:iterations2
    b11(i, :) = b1 + 0.0002*i*ones(n, 1);
    per(i) = norm(0.01*i*ones(n,1));
    x_solv = gauss_elimination_by_row(A1, b11(i, :));
    errors1(i) = norm(x_solv-x1)/norm(x1);
end

b22 = zeros(iterations2, n);
for i = 1:iterations2
    b22(i, :) = b2 + 0.0002*i*ones(n, 1);
    x_solv = gauss_elimination_by_row(A2, b22(i, :));
    errors2(i) = norm(x_solv-x2)/norm(x2);
end

figure
hold on
grid on

plot(per, errors1, 'b-')
plot(per, errors2, 'k-')
title('Зависимость относительной ошибки в решении от относительного возмущения правой части при двух числах обусловленности')
