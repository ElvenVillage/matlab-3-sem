% %Часть 1
iterations = 500;
errors = zeros(iterations, 1);
condition_numbers = zeros(iterations, 1);
c = 10;
n = 50;
x = rand(n, 1) * randi(20);

for i = 1:iterations
    A = matrix_with_cond(n, c);
    
    b = A*x;
     
    x_solv = gauss_elimination_by_row(A, b);
    
    errors(i) = norm(x - x_solv);
    condition_numbers(i) = c;
    
    c = 10*i;
end

figure
%plot(condition_numbers, errors, '-')
loglog(condition_numbers, errors, '-')
grid on
title('Рис. 2 Зависимость нормы разности точного и вычисленного решения от числа обусловленности матрицы')

%Часть 2
iterations2 = 500;

A1 = matrix_with_cond(n, 10);
x1 = rand(n, 1) * randi(20);
b1 = A1 * x1;

errors1 = zeros(iterations2, 1);

A2 = matrix_with_cond(n, 50000);
%A2 = hilb(n);
b2 = A2*x1;

per = zeros(iterations2, 1);
per2 = zeros(iterations2, 1);

errors2 = zeros(iterations2, 1);

b11 = zeros(iterations2, n);
for i = 0:iterations2-1
    normDeltaB1 = norm(b1)*i/(25*iterations2) + norm(b1)/100;
    deltaB1 = rand(n, 1);
    deltaB1 = (deltaB1 ./ norm(deltaB1)) .* normDeltaB1;
    b11(i+1, :) = b1 + deltaB1;
    per(i+1) = norm(deltaB1) / norm(b1);
    x_solv = gauss_elimination_by_row(A1, b11(i+1, :));
    errors1(i+1) = norm(x_solv-x1)/norm(x1);
end
b22 = zeros(iterations2, n);
for i = 0:iterations2-1
    normDeltaB2 = norm(b2)*i/(25*iterations2) + norm(b2)/100;
    deltaB2 = rand(n, 1);
    deltaB2 = (deltaB2 ./ norm(deltaB2)) .* normDeltaB2;
    b22(i+1, :) = b2 + deltaB2;
    per2(i+1) = norm(deltaB2) / norm(b2);
    x_solv = gauss_elimination_by_row(A2, b22(i+1, :));
    errors2(i+1) = norm(x_solv-x1)/norm(x1);
end

figure

loglog(per, errors1, 'b-')
%semilogy(per, errors1, 'b-')
hold on
grid on
loglog(per2, errors2, 'k-')
%semilogy(per, errors2, 'k-')

hold off
title('Рис. 1 Зависимость относительной ошибки в решении от относительного возмущения правой части при двух числах обусловленности')
