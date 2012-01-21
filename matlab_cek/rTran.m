function [f] = rTran(t,y)
global p;
global D;
global v;
global K;
global h;
global uL;
global uR;
m=length(y);
n=m/2;
f=y;
f(1) = (uL - y(1))/h;
f(n+1) = (uL^p + K*uL - y(n+1))/h;
f(n) = (uR - y(n))/h;
f(m) = (uR^p + K*uR - y(m))/h;
f(2:n-1) = ((D*(y(3:n).^p - y(2:n-1).^p)/h - v*0.5*y(3:n).^p) - (D*(y(2:n-1).^p - y(1:n-2).^p)/h - v*0.5*y(1:n-2).^p))/h;
f(n+2:m-1)=(y(2:n-1).^p + K*y(2:n-1) - y(n+2:m-1))/h;
return