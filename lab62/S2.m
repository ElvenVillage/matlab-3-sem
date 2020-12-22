function [S] = S2(A)
    N = max(size(A));
    S = 0;
    for i = 1:N
        for j = 1:N
            if i ~= j
                S = S + A(i,j)^2;
            end
        end
    end
%     S = sqrt(S);
end

