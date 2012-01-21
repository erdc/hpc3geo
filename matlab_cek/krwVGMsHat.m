function [krw] = krwVGMsHat(sHat)
global m
S = SVGMsHat(sHat);
krw = sqrt(S).*(1.0 - (1.0 - S.^(1.0/m)).^m).^2;
return;