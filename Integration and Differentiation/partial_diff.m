function [dfdx dfdy d2fdxdy] = partial_diff(f,x,y,dx,dy)

dfdx = (f(x+dx,y) - f(x-dx,y))/(2*dx);
dfdy = (f(x,y+dy) - f(x,y-dy))/(2*dy);

d2fdxdy = (f(x+dx,y+dy) - f(x+dx,y-dy) - f(x-dx,y+dy) + f(x-dx,y-dy))./(4*dx*dy);
end