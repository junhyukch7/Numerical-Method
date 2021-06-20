function I=gausslege(f,a,b,n)
%I=gaussleg(f,a,b,n)
%Aproximates integral using Gauss-Legendre cuadrature method
%Legendre polin
% input : 
% f = function must be polynominal
% a,b = start end point
% n = number of unknown coefficent
p=polegende(n);
%Polin roots
x=roots(p(n+1,:));
%Change of integration variable if it's needed
if (a~=-1 || b~=1)
   y=flege(f,a,b);
   G=subs(y,x);
else
   G=feval(f,x);		
end
%Polin derivate
pn=polyder(p(n+1,:));
%Calculus of the coeficients
for i=1:n
   C(i)=2./((1-x(i).^2).*((polyval(pn,x(i))).^2));
end
%Escalar product of the function at the nodes and the coeficients
a1 = (b+a)/2; a2=(b-a)/2;
myx = @(xd) a1 + a2*xd; I = 0;
% C = Weight, x = function variable 
for i=1:length(C)
    I = I + a2*C(i)*f(myx(x(i)));
end
end

function p=polegende(n)
% p=polegend(n)
% Saves on the rows of the p matrix the coeficients of the legendre polin.
p(1,1)=1;
p(2,1:2)=[1 0]; 
for k=2:n
   p(k+1,1:k+1)=((2*k-1)*[p(k,1:k) 0]-(k-1)*[0 0 p(k-1,1:k-1)])/k;
end
end

function y=flege(f,a,b)
%Performs variable change if a=!-1 y b=!1
syms x;
x=((b-a)./2).*x+(b+a)./2;
dx=(b-a)./2;
y=feval(f,x)*dx;
end