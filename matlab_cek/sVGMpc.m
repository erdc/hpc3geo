function [s] = sVGMpc(pc)
global m
n = 1.0/(1.0 - m);
s = (1.0 + pc.^n).^(-m);
return