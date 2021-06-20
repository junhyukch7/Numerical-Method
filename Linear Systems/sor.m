function [x,it] = sor(A,b,lamda,u0,es,maxit)
% SOR solves the linear system Au=F using successive over relaxation. Where
% A is diagonally dominant square matrix.
% input 
% A : matrix
% A*x = b
% lamda
% u0 = inital value
% output:
% x,iter

%% Checking proper values of the input parameters
% ===============================================
if nargin < 2
    error ('Too few arguments')
end
if nargin < 6 || isempty(maxit) == 1
    maxit = 1000;
end
if nargin < 5 || isempty(es) == 1
    es = 1e-3;
end
if nargin < 4 || isempty(u0) == 1
    u0 = b*0 + 1;
end
if nargin < 3 || isempty(lamda) == 1
    lamda = 1.5;
elseif 0 > lamda || lamda > 2
    warning('improper value for the parameter w. w = 1.5 was taken instead')
    lamda = 1.5;
end
if size(A,1) ~= size(A,2)
    error('Matrix A should be square.')
elseif size(A,1) ~= size(b,1)
    error('Mismatch between dimensions of A and F')
end
%===================
% SOR Begins
%===================
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);
DL = D - lamda*L;
UE = (1-lamda)*D + lamda*U;
FE = lamda*b;
for it = 1:maxit
    rhv = UE*u0 + FE;
    x = DL\rhv;
    ea = abs(x-u0)/abs(u0);
    if ea < es
        return
    else
        u0 = x;
    end
end
warning('Maximun number of iterations reached. Results may not be accurate')
end