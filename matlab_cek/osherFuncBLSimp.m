function [g] = osherFuncvg(u,xi,ul,ur)
a=0.5;
if ul < ur
g = fBuckLevSimp(u,a) - xi*u;
else 
g = xi*u - fBuckLevSimp(u,a);
end