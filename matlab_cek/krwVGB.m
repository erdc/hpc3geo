function [krw] = krwVGB(S)
global m
krw = S.^2 .*(1.0 - (1.0 - S.^(1.0/m)).^m);
return;