function I = simpson(f,a,b,n,varargin)
% function I = simpson(f,a,b,n,varargin)
% simpson 1/3과 3/8 rule을 적용한 수치 적분
% n = 짝수이면 1/3 홀수이면 1/3 + 3/8
% input: 
% f = function
% a,b = range
% n = range number
% output: 
% I = integral result
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4|isempty(n),n=100;end
n = ceil(n);

if(rem(n,2) == 0) % simpson 1/3
    h=(b-a)/n; xi=a:h:b;
    I= (b-a)*(f(xi(1))+2*sum(f(xi(3:2:end-1)))+4*sum(f(xi(2:2:end)))+f(xi(end)))/(3*n);
else % simpson 1/3 + 3/8
    h=(b-a)/n; xi=a:h:b;
    xi3 = xi(1:n-2); xi8 = xi(n-2:end);
    I3 = (xi3(end)-xi3(1))*((f(xi3(1))+2*sum(f(xi3(3:2:end-1)))+4*sum(f(xi3(2:2:end)))+f(xi3(end)))/(3*(length(xi3)-1)));
    I8 = (xi8(end)-xi8(1))*(f(xi8(1))+3*f(xi8(2))+3*f(xi8(3))+f(xi8(4)))/8;
    I = I3+I8;
end
end
% in the book x0 .... xN
% in the matlab x1.....xN+1
% 그러므로 일반화된 식의 인수의 +1
    
    
        