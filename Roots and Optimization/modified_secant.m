function [root,ea,iter] = modified_secant(func,xr,es,h,maxit,varargin)
if(nargin<2), error('input at least 3 value'); end
if(nargin<3 || isempty(es)), es = 0.0001; end
if(nargin<4 || isempty(h)), h = 0.0001; end
if(nargin<5 || isempty(maxit)), maxit = 50; end
iter = 0; ea = 100;
for i=1:maxit
    iter = iter + 1;
    xrold = xr;
    dfunc = (func((xr+h*xr),varargin{:})-func(xr,varargin{:}))/(h*xr);
    xr = xr - func(xr,varargin{:})/dfunc;
    if(xr~=0), ea = abs(((xr-xrold)/xr)*100); end
    if(ea <= es), break; end
end
root = xr;
end