function [g] = osherFuncBLSimpG(u,xi,ul,ur)
a=0.5;
if ul < ur
g = fBuckLevSimpG(u,a) - xi*u;
else 
g = xi*u - fBuckLevSimpG(u,a);
end