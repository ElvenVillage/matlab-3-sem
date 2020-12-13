%При фиксированном определителе и начальном приближении зависимости от заданной точности
iterations = 13;
n = 10;
d = 20;
x0 = zeros(n, 1);
epsilon = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9, 1e-10, 1e-11, 1e-12, 1e-13];

A = matrix_with_det(n,d);
x = rand(n, 1) * 20;
b = A*x;
norms = zeros(iterations,1);
ksis = zeros(iterations,1);
iters = zeros(iterations,1);

for i = 1:iterations
    [x1, N, r] = grad(A, b, x0, epsilon(i));
    norms(i) = norm(x1-x);
    ksis(i) = norm(r);
    iters(i) = N;
end
figure
loglog(epsilon(1:1:iterations), norms, '-r')
grid on
hold on
loglog(epsilon(1:1:iterations), ksis, '-k')
title('Рис. 1 Зависимости абсолютной погрешности и нормы невязки от \epsilon')
xlabel('eps')
legend('Норма разности точного и вычисленного значений от \epsilon, {10^{-x}}','Норма невязки от \epsilon, {10^{-x}}s')
figure
semilogx(epsilon(1:1:iterations), iters)
grid on
title('Рис. 2 Число итераций от \epsilon, {10^{-x}}')
xlabel('eps')
ylabel('N')


%Часть 2

iterations2 = 13;

norms2 = zeros(iterations2,1);
ksis2 = zeros(iterations2,1);
iters2 = zeros(iterations2,1);
dets = zeros(iterations2, 1);
conds = zeros(iterations2, 1);

x = rand(n, 1) * 20;

for i = 1:iterations2
    A = matrix_with_det(n, 10^(-i));
    dets(i) = det(A);
    conds(i) = norm(A - eye(n));
    
    b = A*x;
    
    [x1, N] = grad(A, b, x0, epsilon(8));
    norms2(i) = norm(x1-x);
    ksis2(i) = norm(b-A*x1);
    iters2(i) = N;
end
figure
loglog(dets, norms2)
grid on
title('Рис. 3 Норма разности точного и вычисленного значений от det,')
figure
semilogx(dets, ksis2)
grid on
title('Рис. 4 Норма невязки от det')
figure
semilogx(dets, iters2)
grid on
title('Рис. 5 Число итераций от det')