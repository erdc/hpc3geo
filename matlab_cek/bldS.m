function [dS] =bldS(uIn)
global vgm
global uMax
u = max(0,min(uMax,uIn));
r = 1 / (1/2 + 2*vgm);
dS = - vgm^(2*vgm)*r*max(u,0).^(r-1);
return;