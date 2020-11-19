%При фиксированном определителе и начальном приближении зависимости от заданной точности
iterations = 13;
n = 100;
d = 150;
x0 = zeros(n,1);
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
loglog(epsilon(1:1:iterations), norms)
grid on
title('Норма разности точного и вычисленного значений от \epsilon, {10^{-x}}')
figure
loglog(epsilon(1:1:iterations), ksis)
grid on
title('Норма невязки от \epsilon, {10^{-x}}s')
figure
loglog(epsilon(1:1:iterations), iters)
grid on
title('Число итераций от \epsilon, {10^{-x}}')


norms2 = zeros(iterations,1);
ksis2 = zeros(iterations,1);
iters2 = zeros(iterations,1);
dets = zeros(iterations, 1);
%Часть 2
for i = 1:iterations
    A = matrix_with_det(n, i*100);
    dets(i) = i*100;
    x = rand(n, 1) * 20;
    b = A*x;
    
    [x1, N] = grad(A, b, x0, epsilon(8));
    norms2(i) = norm(x1-x);
    ksis2(i) = norm(b-A*x1);
    iters2(i) = N;
end
figure
grid on
plot(dets, norms2)
title('Норма разности точного и вычисленного значений от det,')
figure
grid on
plot(dets, ksis2)
title('Норма невязки от det')
figure
grid on
plot(dets, iters2)
title('Число итераций от det')