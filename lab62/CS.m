function [T] = CS(A, i, j)

    N = max(size(A));
    T = eye(N);
    
    if i == j
        c = 1;
        s = 0;
        
    else
    
        iijj = A(i,i) - A(j,j);
    
        if iijj == 0
            c = cos(pi/4);
            s = sin(pi/4);
        else
            eta = iijj / (2 * A(i,j));
            
            if eta >= 0
                t = 1 / (eta + sqrt(1 + eta^2));
            else
                t = -1 * (-eta + sqrt(1 + eta^2));
            end
            c = 1 / sqrt(1 + t^2); s = c*t;
        end
    end
    
    T(i,i) = c; T(i,j) = -s;
    T(j,i) = s; T(j,j) = c;
end

