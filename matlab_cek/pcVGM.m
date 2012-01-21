function [pc] = pcVGM(S)
global m
%m = 1 - 1/n
n = 1.0/(1.0-m);
pc = (S.^(-1.0/m) - 1.0).^(1.0/n);
return;