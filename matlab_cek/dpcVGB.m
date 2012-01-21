function [dpc] = dpcVGM(S)
global m
%m = 1 - 2/n
n = 2.0/(1.0-m);
dpc = (-1.0/(n*m)).*(S.^(-1.0/m) - 1.0).^(1.0/n  - 1.0).*S.^(-1.0/m - 1.0);
return;