function [J] = blTranJacReal(t,y)
global h;
global uL;
global uR;
m=length(y);
J=zeros(m,m);
n=m/2;
%derivatives
%mass
dM = bldS(y(1:n));
%diffusion potential
dP = bldPhi(y(1:n));
%dP = -0.01*ones(size(y(1:n)));
%advection
dF = bldF(y(1:n));
%dF=-ones(size(y(1:n)));
J(1,1) = -1.0/h;     %f(1) = uL - y(1)
J(n+1,n+1) = -1.0/h; %f(n+1) = uL^r - y(n+1)
%J(n,n) = -1.0/h;     %f(n) = uR - y(n)
J(n,n) = -1.0/h;
J(n,n-1) = 1.0/h;
%J(m,m) = -1.0/h;     %f(m) = uR^r - y(m)
J(m,m) = -1.0/h;
J(m,n) = bldS(y(n))/h;
for i=2:n-1
        J(i,i) =  -2.0*dP(i)/h^2;
        J(i,i-1) =  (dP(i-1)/h + 0.5*dF(i+1))/h;
        J(i,i+1) =  (dP(i+1)/h - 0.5*dF(i+1))/h;
        J(n+i,n+i) = -1.0/h;
        J(n+i,i) = dM(i)/h;
end
return