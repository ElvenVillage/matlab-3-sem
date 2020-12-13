function [x, N, r]  = grad(A, b, x, epsilon)
        abc = zeros(size(x, 1),3);
        N = 0;
        
        dx1 = 10; dx2 = 1;
        abc(:, 1) = x;
        while 1
            N = N + 1;
            r = b - A * abc(:, rem(N, 3)+1);
            Ap = A * r;
            alpha = (r'*r) / (r' * Ap);
            
            abc(:, rem(N+1, 3)+1) = abc(:, rem(N, 3)+1) + alpha * r;
            
            if N > 3
                dx1 = norm(abc(:, rem(N+1, 3) + 1) - abc(:, rem(N, 3) + 1));
                dx2 = norm(abc(:, rem(N, 3) + 1) - abc(:, rem(N-1, 3)+1));
            end
            
            if norm(r) < epsilon
                break
            end
%             if abs(dx1^2 / (dx2 - dx1)) < epsilon
%                 break
%             end
         
        end
        x = abc(:, rem(N+1, 3) + 1);
end