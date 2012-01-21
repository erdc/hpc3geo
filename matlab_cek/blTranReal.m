function [f] = blTranReal(t,y)
global h;
global uL;
global uR;
m=length(y);
n=m/2;
f=y;
%mass
%M = max(y(1:n),0).^r;% + min(y(1:n),0);
%transformed variable (mass)
M = blS(y(1:n));
%diffusion potential
P = blPhi(y(1:n));
%P = -0.01*y(1:n);
%advection
F=blF(y(1:n));
%F = - y(1:n);
%right and side
f(1) = (uL - y(1))/h;
f(n+1) = (blS(uL) - y(n+1))/h;
%f(n) = (uR - y(n))/h;
f(n) = (y(n-1) - y(n))/h;
%f(m) = (blS(uR) - y(m))/h;
f(m) = (blS(y(n)) - y(m))/h;
f(2:n-1) = (((P(3:n) - P(2:n-1))/h - 0.5*F(3:n)) - ((P(2:n-1) - P(1:n-2))/h - 0.5*F(1:n-2)))/h;
f(n+2:m-1)=(M(2:n-1) - y(n+2:m-1))/h;
return