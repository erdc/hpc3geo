function [J] = circleDaeJac(z,y)
u=y(1);
v=y(2);
J=zeros(2,2);
J(1,1) = -1.0;
J(2,1) = 2.0*u;
J(2,2) = 2.0*v;
return
