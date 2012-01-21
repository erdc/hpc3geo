function [J] = ssDaeP4Jac(x,y)
global p;
u=y(1);
v=y(2);
w=y(3);
J=zeros(3,3);
if u>= 0,
        J(1,1) = p*u^(p-1);
else
        J(1,1) = 1.0;
end
J(1,3) = -1.0;
J(2,2) = -x^p/2.0;
J(3,2) = 1.0;
return
