function [f] = ssDaeP2(z,y)
global p;
u=y(1);
v=y(2);
w=y(3);
f=y;
if u>=0,
        f(1) = u^p - w;
else 
        f(1) = u - w;
end
f(2) = -(z*v)/2.0;
f(3) = v;
f
return
