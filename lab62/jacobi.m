function [A, G, N] = jacobi(A, epsilon)

    n = max(size(A));
    N = 1;
    G = eye(n);
    
    while S2(A) > epsilon
        [i0, j0] = opt(A);
        T = CS(A, i0, j0);
        G = G * T;
        A = T'*A*T;
        N = N + 1;

%         for i = 1:(n-1)
%             for j = (i+1):n
%                 T = CS(A, i, j);
%                 G = G * T;
%                 A = T'*A*T;
%             end
%         end
    end
end

