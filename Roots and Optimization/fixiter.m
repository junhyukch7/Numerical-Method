function [root,ea,iter]=fixiter(func,xr,es,maxit,varargin)
if nargin<2,error('at least 3 input arguments required'),end
if nargin<3||isempty(es),es=0.0001;end
if nargin<4||isempty(maxit),maxit=50;end
iter = 0; ea = 100;
for i=1:maxit
    iter = iter +1;
    xrold = xr;
    xr = func(xr,varargin{:});
    if(xr~=0), ea = abs((xr - xrold)/xr) * 100; end
    if(ea<=es), break; end
end
root = xr;
end
    