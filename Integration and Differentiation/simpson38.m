function I = simpson38(f,a,b,varargin)
% function I = simpson(f,a,b,n,varargin)
% simpson3/8 rule을 적용한 수치 적분
% n = 홀수개 구간을 가져야 함
% input: 
% f = function
% a,b = range
% n = range number(홀수 개구간)
% output: 
% I = integral result
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end

xx = linspace(a,b,4);
I = (xx(end)-xx(1))*(f(xx(1))+3*f(xx(2))+3*f(xx(3))+f(xx(end)))/8;

end