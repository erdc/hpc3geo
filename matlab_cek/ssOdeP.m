function [f] = ssOdeP(z,y)
global p
r = 1/p - 1
u=y(1)
v=y(2)
f=y
f(1) = v
f(2) = (-z./2).*(1.0 + r*u.^(r-1)).*v 
return
