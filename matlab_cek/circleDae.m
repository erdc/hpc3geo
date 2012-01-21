function [f] = circleDae(z,y)
u=y(1);
v=y(2);
f=y;
f(1) = -u;
f(2) = u^2 + v^2 - 1.0;
return
