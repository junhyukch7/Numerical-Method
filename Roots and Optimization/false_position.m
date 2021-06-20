function [root,fx,ea,iter] = false_position(func,xl,xu,es,maxit,varargin)
if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4||isempty(es), es=0.0001;end
if nargin<5||isempty(maxit), maxit=100;end
iter = 0; xr = xl; ea = 100;
for i=1:maxit
    iter = iter+1;
    xrold = xr;
    xr = xu-(func(xu,varargin{:})*(xu-xl))/(func(xu,varargin{:})-func(xl,varargin{:}));
    if(xr~=0)
        ea = abs((xr - xrold)/xr) * 100;
    end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if (test < 0)
        xu = xr;
    elseif (test > 0)
        xl = xr;
    else
        ea = 0;
        break;
    end
    if(ea <=es), break; end
end
root = xr; fx = func(xr, varargin{:});
end