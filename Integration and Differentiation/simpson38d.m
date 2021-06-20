function I = simpson38d(x,y,varargin)
% function I = simpson38d(x,y,varargin)
% simpson3/8 rule을 적용한 수치 적분(데이터 이용)
% input: 
% x,y = data(must size == 4)
% output: 
% I = integral result
if nargin<2,error('at least 3 input arguments required'),end
if((length(x)~= 4) || (length(y)~=4)), error("size err"); end
I = (x(end)-x(1))*((y(1))+3*(y(2))+3*(y(3))+(y(end)))/8;
end