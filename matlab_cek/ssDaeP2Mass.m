function [M] = ssDaeP2Mass(z,y)
u=y(1);
v=y(2);
w=y(3);
M=zeros(3,3);
M(2,1) = z/2.0;
M(2,2) = 1.0;
M(3,3) = 1.0;
return
