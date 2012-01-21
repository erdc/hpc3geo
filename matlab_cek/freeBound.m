function [F] = freeBound(y)
global p;
global yL;
global yR;
N = length(y)-1;
zStar = y(N+1);
h = zStar/(N-1);
z = [0:h:zStar]';
%BC's
F=y;
F(1) = (yL - y(1))/h;
F(N) = (yR - y(N))/h;
F(2:N-1) = ((y(3:N).^p - y(2:N-1).^p)/h  + 0.5*z(3:N).*(y(3:N).^p + y(3:N)) - (y(2:N-1).^p - y(1:N-2).^p)/h  - 0.5*z(1:N-2).*(y(1:N-2).^p + y(1:N-2)))/h;
F(N+1) = (y(N).^p - y(N-1).^p)/h;
return;