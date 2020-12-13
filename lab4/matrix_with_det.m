function S = matrix_with_det(n,d)
    
    s = ones(1,n);
    r = randi(n,1,1);
    s(r) = d;
%     s = ones(1, n) .* d^(1/n);
    
    while max(s) / min(s) > 10
        [~,q] = max(s);
        [~,w] = min(s);
        
        s(q) = s(q) / 2;
        s(w) = s(w) * 2;
    end
    
   
    A = diag(s);
    
%     for i = 2:n
%         for j = 1:i-1
%             A(i,j) = rand();
%         end
%     end
    
    Q = gallery('orthog', n);
    %P = inv(Q);
    S = Q'*A*Q;
    

end

