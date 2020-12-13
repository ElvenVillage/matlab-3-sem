function [B] = matrix_with_cond(n,C)
a = rand(n) * 20;
[u, ~, v] = svd(a);

s = ones(1, n);
s(1) = C;
s = diag(s);

B = u*s*v';
end

