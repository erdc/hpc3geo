function [J] = ssDaePJac(z,y)
global p;
u=y(1);
v=y(2);
w=y(3);
J=zeros(3,3);
J(1,1) = 1.0;
if w-u >0,
J(3,1) = 1.0 + p*(w - u)^(p-1);
J(3,3) = -p*(w - u)^(p-1);
else
J(3,1) = 1.0
J(3,3) = 0
end
return
