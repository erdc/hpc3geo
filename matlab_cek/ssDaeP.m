function [f] = ssDaeP(z,y)
global p;
u=y(1);
v=y(2);
w=y(3);
f=y;
f(1) = v;
f(2) = 0.0;
f(3) = u - (max(w - u,0))^p ;
return
