function [J,f] = jfreact2(x,u,v,varargin)
del = 0.000001;
df1_x1 = (u(x(1) + del*x(1),x(2)) - u(x(1),x(2))) / (del*x(1));
df1_x2 = (u(x(1),x(2)+del*x(2)) - u(x(1),x(2))) / (del*x(2));
df2_x1 = (v(x(1) + del*x(1),x(2)) - v(x(1),x(2))) / (del*x(1));
df2_x2 = (v(x(1),x(2)+del*x(2)) - v(x(1),x(2))) / (del*x(2));

J = [df1_x1 df1_x2; df2_x1 df2_x2];
f1 = u(x(1),x(2));
f2 = v(x(1),x(2));
f = [f1;f2];

end