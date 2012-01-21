function [J] = profileJac(y,zStar)
global p;
global yL;
global yR;
global N;
h = zStar/(N-1.0);
z = [0:h:zStar]';
%BC's
J=zeros(N,N);
J(1,1) = -1.0/h;
J(N,N) = -1.0/h;
phiPrime=p*max(y,0).^(p-1) + (1.0 - max(sign(y),0));
for i=2:N-1,
        J(i,i)   =(-2.0*phiPrime(i))/h^2;
        J(i,i+1) =((phiPrime(i+1))/h  + 0.25*z(i+1).*(phiPrime(i+1) + 1.0))/h;
        J(i,i-1) =((phiPrime(i-1))/h  - 0.25*z(i-1).*(phiPrime(i-1) + 1.0))/h;
end
return;