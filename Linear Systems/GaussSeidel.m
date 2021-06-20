function [x,ea,iter] = GaussSeidel(A,b,es,maxit)
% GaussSeidel: Gauss Seidel method
%   [x,ea,iter] = GaussSeidel(A,b): Gauss Seidel without relaxation
% input:
%   A = coefficient matrix
%   b = right hand side vector
%   es = stop criterion (default = 0.00001%)
%   maxit = max iterations (default = 50)
% output:
%   x = solution vector
%   ea = maximum relative error(%)
%   iter = number of iterations
if nargin<2,error('at least 2 input arguments required'),end
if nargin<4|isempty(maxit),maxit=50;end
if nargin<3|isempty(es),es=0.00001;end
[m,n] = size(A);
if m~=n, error('Matrix A must be square'); end
C = A;
for i = 1:n
  C(i,i) = 0; % C값 세팅 대각 성분 모두 0
  x(i) = 0; % x백터 초기화
end
x = x'; % 해는 열백터 형태여야 함
for i = 1:n
  C(i,1:n) = C(i,1:n)/A(i,i); % C행렬의 대각성분을 제외한 성분 셋팅
end
for i = 1:n
  d(i) = b(i)/A(i,i); % d값 세팅
end
iter = 0;
while (1)
  xold = x;
  for i = 1:n
    x(i) = d(i)-C(i,:)*x;
    if x(i) ~= 0
      ea(i) = abs((x(i) - xold(i))/x(i)) * 100;
    end
  end
  iter = iter+1;
  if max(ea)<=es | iter >= maxit, break, end
end
ea = max(ea);
end