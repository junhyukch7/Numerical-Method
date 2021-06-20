function I = simpsMulti(func,x,y,z,varargin)
% function I = simpsMulti(func,x,y,z,varargin)
% simpson법칙을 이용한 단일구간에 대한 다중적분(2,3)
% input:
% func = function for integral
% x,y,z = 나누려는 구간,(반드시 linspace(start,end,3)을 사용하여 3등분)
% output : 적분 결과
if(nargin<3), error("errot to calulate simpson"); end
if(isempty(z)) % 2중적분
    for i=1:length(x)
        xr(i) = (x(end)-x(1))*(func(x(i),y(1)) + 4*func(x(i),y(2)) +func(x(i),y(3)))/6;
    end
    I = (y(end)-y(1))*(xr(1)+4*xr(2)+xr(3))/6;
else % 3중적분
    for i=1:length(z)
        for j=1:length(y)
            yr(j) = (x(end)-x(1))*(func(x(1),y(j),z(i)) + 4*func(x(2),y(j),z(i))...
                +func(x(3),y(j),z(i)))/6;
        end
        Ir(i) = (y(end)-y(1))*(yr(1)+4*yr(2)+yr(3))/6;
    end
    I = (z(end)-z(1))*(Ir(1)+4*Ir(2)+Ir(3))/6;
end
end