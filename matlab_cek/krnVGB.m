function [krn] = krnVGB(S)
global m
krn = (1.0 - S).^2 .*(1.0 - S.^(1.0/m)).^m;
return;