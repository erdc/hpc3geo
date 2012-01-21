function [g] = osherFuncvg(u,xi,ul,ur)
if ul < ur
g = FvS2(u) - xi*u;
else 
g = xi*u - FvS2(u);
end