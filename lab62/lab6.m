n = 10;

%Часть 1
%От точности

epsilon = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9, 1e-10, 1e-11, 1e-12];
iterations1 = max(size(epsilon));

%Матрица с хорошей отделимостью
S = zeros(1, n);
for i = 1:n
    S(i) = i;
end
P = gallery('orthog', n);
A = P*diag(S)*P';


error_norms1 = zeros(1, iterations1);
sweeps1 = zeros(1, iterations1);
residuals1 = zeros(1, iterations1);


% БЕЗ СДВИГА

for i = 1:iterations1
    [B, Q, W] = jacobi(A, epsilon(i));
    S_n_n = diag(B);
    S_n = sort(S_n_n);
    
    error_norms1(i) = norm(S_n - sort(S'), Inf);
    sweeps1(i) = W;
    residuals1(i) = norm(A*Q-Q*diag(S_n_n), Inf);
end


figure
loglog(epsilon, sweeps1, '-r');
% hold on
grid on
% loglog(epsilon, sweeps10, '-b');
title('Рис. 1 Зависимость числа итераций от точности')
% legend('без сдвига', 'сдвиг')
xlabel('eps')
ylabel('N')

figure 
loglog(epsilon, error_norms1, '-r');
hold on
grid on
loglog(epsilon, residuals1, '-b');
title('Рис. 2 Норма разности точного и вычисленного значений и норма невязки от заданной точности')
legend('Ошибка', 'Невязка')
xlabel('eps')


%Часть 2
%От величины отделимости

iterations2 = 12;

error_norms2 = zeros(1, iterations2);
sweeps2 = zeros(1, iterations2);
residuals2 = zeros(1, iterations2);
x = zeros(1, iterations2);
sweeps20 = zeros(1, iterations2);

for k = 1:iterations2
    S = ones(1, n);
    x(k) = 1/(10^k);
    for i = 1:(n/2)
        S(i) = 1 + i*x(k);
    end
   
    A = P*diag(S)*P';
    
    [B, Q, W] = jacobi(A, epsilon(8));
    S_n_n = diag(B);
    S_n = sort(S_n_n);
    
    error_norms2(k) = norm(S_n - sort(S'), Inf); 
    
    sweeps2(k) = W;
    residuals2(k) = norm(A*Q-Q*diag(S_n_n), Inf);
    
end



figure
loglog(x, sweeps2, '-b');
grid on

title('Рис. 3 Зависимость числа итераций от величины отделимости')
xlabel('lambda')
ylabel('N')

figure 
loglog(x, error_norms2);
grid on
hold on
title('Рис. 4 Норма разности точного и вычисленного значений от величины отделимости')
loglog(x, residuals2);
legend('норма разности', 'норма невязки')

