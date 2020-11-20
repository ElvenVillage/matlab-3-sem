function [B] = matrix_with_cond(n,C)
a = 2*rand(n,n)-1 + 2*rand(n,n)-1;     
%a = a+a';              % symmetric with random entries beween -2 and 2
%C = 2345;              % desired condition number
[u, s, v] = svd(a);
s = diag(s);           % s is vector
% ===== linear stretch of existing s
s = s(1)*( 1-((C-1)/C)*(s(1)-s)/(s(1)-s(end))) ;
% =====
s = diag(s);           % back to matrix
B = u*s*v';
end

