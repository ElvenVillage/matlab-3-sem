function x = gauss_elimination_by_row(A, b)

    n = size(A, 1);  
    r = zeros(n, 1); 
    for i = 1 : 1 : n    
        r(i) = i;
    end

    x = zeros(n, 1); 
    
    for k = 1 : 1 : n  
        max = abs(A(r(k), r(k)));    
        max_pos = k;    
        for l = k : 1 : n        
            if abs(A(r(k), r(l))) > max            
                max = abs(A(r(k), r(l)));            
                max_pos = l;            
            end
        end
    
        temp_r = r;
        r(k) = temp_r(max_pos);
        r(max_pos) = temp_r(k);
         
        for i = 1 : 1 : n
            if i ~= k
                zeta = A(i, r(k)) / A(k, r(k));
                for j = k : 1 : n
                    A(i, r(j)) = A(i, r(j)) - A(k, r(j)) * zeta;                       
                end
                b(i) = b(i) - b(k) * zeta;
            end
        end
    end


    for i = 1 : 1 : n
        x(r(i)) = b(i) / A(i, r(i));
    end

end