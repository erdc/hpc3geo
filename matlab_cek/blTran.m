function [f] = blTran(t,y)
global p;
global q;
global r;
global D;
global v;
global h;
global uL;
global uR;
m=length(y);
n=m/2;
f=y;
P=y;
F=y;
M=y;
%diffusion potential
P = D*max(y(1:n),0).^p;% + min(y(1:n),0);
%advection
F = v*max(y(1:n),0).^q;% + min(y(1:n),0);
%mass
M = max(y(1:n),0).^r;% + min(y(1:n),0);
%right and side
f(1) = (uL - y(1))/h;
f(n+1) = (uL^r - y(n+1))/h;
%f(n) = (uR - y(n))/h;
f(n) = (y(n-1) - y(n))/h;
%f(m) = (uR^r - y(m))/h;
f(m) = (y(n)^r - y(m))/h;
f(2:n-1) = (((P(3:n) - P(2:n-1))/h - 0.5*F(3:n)) - ((P(2:n-1) - P(1:n-2))/h - 0.5*F(1:n-2)))/h;
f(n+2:m-1)=(M(2:n-1) - y(n+2:m-1))/h;
return