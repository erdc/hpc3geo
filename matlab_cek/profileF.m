function [F] = profileF(y,zStar)
global p;
global yL;
global yR;
global N;
h = zStar/(N-1);
z = [0:h:zStar]';
%BC's
F=y;
F(1) = (yL - y(1))/h;
F(N) = (yR - y(N))/h;
phi=max(y,0).^p + min(y,0);
F(2:N-1) = ((phi(3:N) - phi(2:N-1))/h  + 0.25*z(3:N).*(phi(3:N) + y(3:N)) - (phi(2:N-1) - phi(1:N-2))/h  - 0.25*z(1:N-2).*(phi(1:N-2) + y(1:N-2)))/h;
return;