test_a = @(x) x^2 - 3*x + 2;
phi_a = @(x) -2/(x-3);

eps = 1e-8;

a = bisection(0.5, 1.7, test_a, eps);
b = fixed_point(0.5, phi_a, eps);