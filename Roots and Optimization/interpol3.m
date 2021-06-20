function [xopt,fopt,ea,iter] = interpol3(func,x1,x2,x3,es,maxit,varargin)
if (nargin < 4), error('input at least 3 value'),end
if (nargin < 5 || isempty(es)), es = 0.0001; end
if (nargin < 6 || isempty(maxit)),maxit = 50; end
iter = 0; f1 = func(x1,varargin{:}); f2 = func(x2,varargin{:}); f3 = func(x3,varargin{:});
% x4 : x2, x3 사이에 있을 때 -->  x1 x2 x3 = x2 x4 x3
% x4 : x1, x2 사이에 있을 때 -->  x1 x2 x3 = x1 x4 x2
xopt_old = x2; % x4를 구하기 전까지는 x2가 최대 혹은 최소임
while(1) % x4 = xopt
  xopt = x2-0.5*((x2-x1).^2*(f2-f3)-(x2-x3).^2*(f2-f1))/((x2-x1)*(f2-f3)-(x2-x3)*(f2-f1));
  fopt = func(xopt,varargin{:});
  iter = iter + 1;
  if (xopt > x2)
      x1 = x2; f1 = f2;
      x2 = xopt; f2 = fopt; % x2는 얕은 복사
  else
      x3 = x2; f3 = f2;
      x2 = xopt; f2 = fopt; % x2는 얕은 복사이기 때문에 나중에 입력
  end
  if (xopt ~= 0), ea=abs((xopt - xopt_old)/xopt) * 100; end
  if (ea<=es || iter>=maxit), break, end
  xopt_old = xopt;
end
end
            
