function I = simpson13d(x,y,varargin)
% function I = simpson13d(x,y,varargin)
% simpson 1/3을 적용한 수치 적분(함수가 아닌 데이터이용)
% n = 짝수
% input: 
% x,y = data
% output: 
% I = integral result
if nargin<2,error('at least 3 input arguments required'),end
if(length(x) ~= length(y)), error("size err"); end

if(length(x) == 3)
    I= (x(end)-x(1))*((y(1))+2*sum((y(3:2:end-1)))+4*sum((y(2:2:end)))+(y(end)))/6;
else
    I= (x(end)-x(1))*((y(1))+2*sum((y(3:2:end-1)))+4*sum((y(2:2:end)))+(y(end)))/(3*(length(x)-1));
end
end