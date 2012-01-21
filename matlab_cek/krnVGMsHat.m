function [krn] = krnVGMsHat(sHat)
global m
S = SVGMsHat(sHat);
krn = sqrt(1.0 - S).*(1.0 - S.^(1.0/m)).^(2.0*m);
return;