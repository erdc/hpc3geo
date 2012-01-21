function [krn] = krnVGMpc(pc)
global m
n = 1.0/(1.0 - m);
krn = sqrt(1.0 - sVGMpc(pc)).*(pc.^(n-1) .* sVGMpc(pc)).^2;
return;