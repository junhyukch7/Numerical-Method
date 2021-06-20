function [L,U] = my_LU_Pivot(A)
% 피봇팅을 고려한 LU분해법
[m,n] = size(A);

if(m ~= n), error("matrix must be m == n"); end
L = eye(n);
U = A;

% partial pivoting
for k = 1:n-1
    [big,i] = max(abs(U(k:n,k)));
    ipr = i+k-1;
    if(ipr~=k), U([k,ipr],:) = U([ipr,k],:); end
end

for i = 1:n-1 % U 상삼각행렬에서 빼는 횟수
    for j = i+1:n % L 하상삼각행렬에서 factor가 들어가는 시점
        L(j,i) = U(j,i)/U(i,i); % factor
        U(j,i) = 0; % gauss 소거법은 첫번째 원소가 모두 0
        % n번째 행 - fatctor * 첫번째 행
        U(j,i+1:n) = U(j,i+1:n) - L(j,i) * U(i,i+1:n);
    end
end
end