function [pc] = pcVGB(S)
global m
%m = 1 - 2/n
n = 2.0/(1.0-m);
pc = (S.^(-1.0/m) - 1.0).^(1.0/n);
return;