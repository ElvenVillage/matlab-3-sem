function S = matrix_with_det(n,d)
    
    s = ones(1,n);
    r = randi(n,1,1);
    s(r) = d;
    
%     for i = 1:fix(log(d))
%         if i ~= r
%             s(r) = s(r) / 2;
%             s(i) = s(i) * 2;
%         end
%     end
    
    A = diag(s);
    
%     for i = 2:n
%         for j = 1:i-1
%             A(i,j) = rand();
%         end
%     end
    
    Q = gallery('orthog', n);
    P = inv(Q);
    S = P*A*Q;
end

