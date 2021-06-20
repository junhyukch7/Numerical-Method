function I = simpson13(f,a,b,n,varargin)
% function I = simpson13(f,a,b,n,varargin)
% simpson 1/3을 적용한 수치 적분
% n = 짝수
% input: 
% f = function
% a,b = range
% n = range number(짝수)
% output: 
% I = integral result
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4|isempty(n),n=100;end
n = ceil(n);

h=(b-a)/n; xi=a:h:b;
if(n == 1)
    xi = linspace(a,b,3);
    I= (b-a)*(f(xi(1))+2*sum(f(xi(3:2:end-1)))+4*sum(f(xi(2:2:end)))+f(xi(end)))/6;
else
    I= (b-a)*(f(xi(1))+2*sum(f(xi(3:2:end-1)))+4*sum(f(xi(2:2:end)))+f(xi(end)))/(3*n);
end

end