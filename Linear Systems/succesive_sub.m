function [xy,iter] = succesive_sub(func1,func2,x,y,maxit)
% function [x,et,iter] = succesive_sub(func1,func2,x,y,maxit)
% 비선형 방정식 해를 구하기 위한 연속대입법
% input: 
% func1 : x =, func2: y =
% output : [x,et,iter]
if(nargin<4), error("input least 4 value"); end
if(nargin<5 || isempty(maxit)), maxit = 50; end
iter = 0;
if(nargin(func1) ==1)
    while(1)
    % 입력인수가 하나일때가 있고 두개일때가 있네
    x = func1(y);
    y = func2(x);
    iter = iter + 1;
    if(iter >= maxit), break; end
    end
end
if(nargin(func1) == 2)
    while(1)
    % 입력인수가 하나일때가 있고 두개일때가 있네
    x = func1(x,y);
    y = func2(x,y);
    iter = iter + 1;
    if(iter >= maxit), break; end
    end
end
xy = [x,y]';
end