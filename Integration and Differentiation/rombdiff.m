function [d,ea,iter] = rombdiff(func,x,es,maxit,varargin)
% function [d,ea,iter] = rombdiff(func,x,es,maxit,varargin)
% romberg: Romberg integration quadrature
% q = romberg(func,a,b,es,maxit,varargin):
% Romberg integration.
% input:
% func = name of function
% a, b = integration limits
% es = desired relative error 
% maxit = maximum allowable ite
% p1,p2,... = additional parameters used by func
% output:
% q = integral estimate
% ea = approximate relative error (%)
% iter = number of iterations 

if(nargin<2), error("at least 2 input arg"); end
if(nargin<3 || isempty(es)), es=0.00001; end
if(nargin<4 || isempty(maxit)), maxit = 50; end

n=1;
DY(1,1) = dydxnew(func,x,n,varargin{:});
iter = 0;
ea = 100;
while(iter<maxit)
    iter = iter+1; n = 2^iter;
    DY(iter+1,1) = dydxnew(func,x,n,varargin{:});
    for k=2:iter+1
        j = 2+iter-k;
        DY(j,k) = (4^(k-1)*DY(j+1,k-1)-DY(j,k-1))/(4^(k-1)-1);
    end
    if(DY(1,iter+1)~=0)
        ea = abs((DY(1,iter+1)-DY(2,iter))/DY(1,iter+1))*100;
    end
    if(ea<=es), break; end
end
d = DY(1,iter+1);
end
% 중심차분을 이용하여 1차도함수를 구하고
function d = dydxnew(func,x,n,varargin)
a = x-x/n;
b = x+x/n;
d = (func(b,varargin{:})-func(a,varargin{:}))/(b-a);
end