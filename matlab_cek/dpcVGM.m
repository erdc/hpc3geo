function [dpc] = dpcVGM(S)
global m
%m = 1 - 1/n
n = 1.0/(1.0-m);
dpc = (-1.0/(n*m)).*(S.^(-1.0/m) - 1.0).^(-m).*S.^(-1.0/m - 1.0);
return;