function [a2,b2,r2] = powerfit(x,y)
% 멱모델 자동 접합
% input :
% x: log10을 취하지 않은 x
% y: log10을 취하지 않은 y
% output:
% a2,b2 = a2*xp^(b2)
% r2 : 변환되지 않은 모델(a2*xp^(b2))의 결정계수
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
x = x(:); y = y(:); % convert to column vectors
x1 = log10(x); y1 = log10(y);
sx = sum(x1); sy = sum(y1);
sx2 = sum(x1.*x1); sxy = sum(x1.*y1); sy2 = sum(y1.*y1);
a(1) = (n*sxy-sx*sy)/(n*sx2-sx^2); % 기울기
a(2) = sy/n-a(1)*sx/n; % 절편
a2 = 10^(a(2));
b2 = a(1); % 
ypred = a2*x.^(b2);
Sr = sum((y - ypred).^2);
St = sum((y - mean(y)).^2);
r2 = (St-Sr)/St;
% plotting 
subplot(2,1,1);
xp = linspace(min(x),max(x));
yp = a2*xp.^(b2);
plot(x,y,'o',xp,yp); grid on;
title("Fit (untrans)"); xlabel("x"); ylabel("y");
subplot(2,1,2)
loglog(x,y,'o',xp,yp); grid on;
title("Fit (trans)"); xlabel("x"); ylabel("y");
end