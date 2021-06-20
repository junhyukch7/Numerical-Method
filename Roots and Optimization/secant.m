function [root,ea,iter] = secant(func,xi_1,xi,es,maxit,varargin)
if(nargin<3), error('input at least 3 value'); end
if(nargin<4 || isempty(es)), es = 0.0001; end
if(nargin<5 || isempty(maxit)), maxit = 50; end
iter = 0; ea = 100;
for i=1:maxit
    iter = iter + 1;
    xiold = xi; % ea를 구하기 위해서 만든 변수
    dfunc = (func(xi_1,varargin{:})-func(xi,varargin{:}))/(xi_1-xi);
    xi = xi - func(xi,varargin{:})/dfunc;
    if(xi~=0), ea = abs(((xi-xiold)/xi)*100); end
    if(ea <= es), break; end
    xi_1 = xiold; %후향 차분을 위해 이전 값을 업데이트
end
root = xi;
end