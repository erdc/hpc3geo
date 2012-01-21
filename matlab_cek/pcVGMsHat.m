function [pc] = pcVGM(sHat)
global m
%m = 1 - 1/n
n = 1.0/(1.0-m);
S = SVGMsHat(sHat);
pc = (S.^(-1.0/m) - 1.0).^(1.0/n);
return;