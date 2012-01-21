function [dpc] = dpcVGMsHat(sHat)
global m
%m = 1 - 1/n
n = 1.0/(1.0-m);
S = SVGMsHat(sHat);
dpc = (-1.0/(n*m)).*(S.^(-1.0/m) - 1.0).^(1.0/n  - 1.0).*S.^(-1.0/m - 1.0);
return;