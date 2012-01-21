function [M] = ssDaeP2Mass(z,y)
u=y(1);
v=y(2);
w=y(3);
M=zeros(3,3);
M(1,1) = 1.0;
M(2,2) = 1.0;
M(2,3) = z/2;
return
