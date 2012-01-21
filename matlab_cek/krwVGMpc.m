function [krw] = krwVGMpc(pc)
global m
n = 1.0/(1.0 - m);
krw = sqrt(sVGMpc(pc)).*(1.0 - pc.^(n-1) .* sVGMpc(pc)).^2;
return;