function U = my_chol(A)
% cholesky 분해법. 대칭행렬일때 사용
[m,n] = size(A); At = A';
if(m ~= n), error("size must be square"); end
if(A ~= At), error("cholesky method muut be A = A' "); end
U = zeros(m);

for i=1:n
    my_sum = sum(U(1:i-1,i).^2);
    U(i,i) = sqrt(A(i,i) - my_sum);
    for j = i+1:n
        if( i+1 > n), break; end
        U(i,j) = (A(i,j) - sum(U(1:i-1,i) .* U(1:i-1,j))) / U(i,i);
    end
end
end