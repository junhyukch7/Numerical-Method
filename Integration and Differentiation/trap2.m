function I = trap2(x,y,varargin)
% function I = trap2(x,y,varargin)
% 단일사다리꼴 공식을 이용한 적분(함수가 아닌 data를 사용)
% input:
%   x,y = input data
% output:
%   I = integral estimate
n = length(x)-1; I = 0;
for i = 1 : n
  I = I + (x(i+1)-x(i))*(y(i)+y(i+1))/2;
end
