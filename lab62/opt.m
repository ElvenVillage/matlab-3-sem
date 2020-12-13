function [i0, j0] = opt(A)

    N = max(size(A));
    
    rm = 0;
    for i = 1:N
        for j = 1:N
            if i ~= j && abs(A(i,j)) > rm
                rm = abs(A(i,j));
                i0 = i;
                j0 = j;
            end
        end
    end
    
%     rmax = 0; i0 = 0; j0 = 0;
%     for i = 1:N
%         r = 0; 
%         for j = 1:N
%             if i ~= j
%                 r = r + A(i,j)^2;
%             end
%         end
%         if r > rmax
%             rmax = r;
%             i0 = i;
%         end
%     end
%     
%     for j = 1:N
%         jmax = 0;
%         if (j ~= i0) && (abs(A(i0, j)) > jmax)
%             jmax = abs(A(i0, j));
%             j0 = j;
%         end
%     end
end

