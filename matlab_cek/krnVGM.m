function [krn] = krnVGM(S)
global m
krn = sqrt(1.0 - S).*(1.0 - S.^(1.0/m)).^(2.0*m);
return;