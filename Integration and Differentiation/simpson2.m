function I = simpson2(yi,a,b,n,varargin)
% function I = simpson2(yi,a,b,n,varargin)
% simpson 1/3과 1/8 rule을 적용한 수치 적분(함수가 아닌 data를 사용)
% input: 
% xi : data result
% a,b = range
% n = range number
% output: 
% I = integral result
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4|isempty(n),n=100;end
n = ceil(n);

if(rem(n,2) == 0) % simpson 1/3
    I= (b-a)*((yi(1))+2*sum((yi(3:2:end-1)))+4*sum((yi(2:2:end)))+(yi(end)))/(3*n);
else % simpson 1/3 + 3/8
    xx = linspace(a,b,n+1);
    yi3 = yi(1:n-2); yi8 = yi(n-2:end); 
    xi3 = xx(1:n-2); xi8 = xx(n-2:end); 
    I3 = (xi3(end)-xi3(1))*(((yi3(1))+2*sum((yi3(3:2:end-1)))+4*sum((yi3(2:2:end)))+(yi3(end)))/(3*(length(xi3)-1)));
    I8 = (xi8(end)-xi8(1))*((yi8(1))+3*(yi8(2))+3*(yi8(3))+(yi8(4)))/8;
    I = I3+I8;
end
end
% in the book x0 .... xN
% in the matlab x1.....xN+1
% 그러므로 일반화된 식의 인수의 +1
    