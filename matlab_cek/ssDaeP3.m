function [f] = ssDaeP2(z,y)
global p;
u=y(1);
v=y(2);
w=y(3);
f=y;
f(1) = v
f(2) = 0
if w - u >=0
f(3) = u - (w - u)^p;
else
f(3) = u - w;
end
return
