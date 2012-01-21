function [J] = freeBoundJac(y)
global p;
global yL;
global yR;
N = length(y)-1;
zStar = y(N+1);
h = zStar/(N-1.0);
dhdzStar = 1.0/(N-1.0);
z = [0:h:zStar]';
%BC's
J=zeros(N+1,N+1);
J(1,1) = -1.0;
J(N,N) = -1.0;
for i=2:N-1,
        J(i,i)   =(-2.0*p*y(i).^(p-1))/h;
        J(i,i+1) =(p*y(i+1).^(p-1))/h  + 0.5*z(i+1).*(p*y(i+1).^(p-1) + 1.0);
        J(i,i-1) =(p*y(i-1).^(p-1))/h  - 0.5*z(i-1).*(p*y(i-1).^(p-1) + 1.0);
        J(i,N+1) = -((y(i+1).^p - 2.0*y(i).^p  + y(i-1).^p)/h^2)*dhdzStar;  
end
J(N+1,N) = p*y(N).^(p-1);
J(N+1,N-1) = -p*y(N-1).^(p-1);
return;