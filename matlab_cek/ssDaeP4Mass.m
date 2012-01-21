function [M] = ssDaeP4Mass(x,y)
global p;
u=y(1);
v=y(2);
w=y(3);
M=zeros(3,3);
M(2,1) = x^p/2.0;
M(2,2) = p*x^(p-1);
M(3,3) = p*x^(p-1);
return
