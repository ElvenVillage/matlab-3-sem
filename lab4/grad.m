function [x, N, r] = grad(A, b, x, eps)
        N = 0;
        %normb = norm(b);
        
        while 1
            N = N + 1;
            r = b - A * x;
            Ap = A * r;
            alpha = (r'*r) / (r' * Ap);
            x = x + alpha * r;
            
            if alpha*norm(r) < eps
                break;
            end
        end
    end