function [a3,b3,r2] = sat_growth(x,y)
% 포화성장률모델 자동 접합
% input :
% x: x
% y: y
% output:
% a3,b3 = (a3*x) / (b3+x)
% r2 : 변환되지 않은 모델((a3*x) / (b3+x))의 결정계수
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
x = x(:); y = y(:); % convert to column vectors
x1 = 1./x; y1 = 1./y;
sx = sum(x1); sy = sum(y1);
sx2 = sum(x1.*x1); sxy = sum(x1.*y1); sy2 = sum(y1.*y1);
a(1) = (n*sxy-sx*sy)/(n*sx2-sx^2); % 기울기
a(2) = sy/n-a(1)*sx/n; % 절편
a3 = 1/a(2);
b3 = a(1)*a3; % 
ypred = (a3.*x)./(b3+x);
Sr = sum((y - ypred).^2);
St = sum((y - mean(y)).^2);
r2 = (St-Sr)/St;
% plotting 
subplot(2,1,1);
xp = linspace(min(x),max(x));
yp = (a3.*xp)./(b3+xp);
plot(x,y,'o',xp,yp); grid on;
title("Fit (untrans)"); xlabel("x"); ylabel("y");
subplot(2,1,2)
xp2 = linspace(min(x1),max(x1));
yp2 = a(1).*xp2 + a(2);
plot(x1,y1,'o',xp2,yp2); grid on;
title("Fit (trans)"); xlabel("x"); ylabel("y");
end