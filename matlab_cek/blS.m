function [S] =blS(uIn)
global uMax
global vgm
u = max(0,min(uMax,uIn));
r = 1 / (1/2 + 2*vgm);
S = 1.0 - vgm^(2*vgm)*max(u,0).^r;
return;