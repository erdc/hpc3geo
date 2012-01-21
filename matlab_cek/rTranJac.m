function [J] = rTranJac(t,y)
global p;
global D;
global v;
global K;
global h;
global uL;
global uR;
m=length(y);
J=zeros(m,m);
n=m/2;
J(1,1) = -1.0/h;     %f(1) = uL - y(1)
J(n+1,n+1) = -1.0/h; %f(n+1) = uL^p + K*uL - y(n+1)
J(n,n) = -1.0/h;     %f(n) = uR - y(n)
J(m,m) = -1.0/h;     %f(m) = uR^p + K*uR - y(m)
for i=2:n-1
        J(i,i) =  -2.0*D*p*y(i)^(p-1)/h^2;
        J(i,i-1) =  ((D/h + 0.5*v)*p*y(i-1)^(p-1))/h;
        J(i,i+1) =  ((D/h - 0.5*v)*p*y(i+1)^(p-1))/h;
        J(n+i,n+i) = -1.0/h;
        J(n+i,i) = (K+p*y(i)^(p-1))/h;
end
return