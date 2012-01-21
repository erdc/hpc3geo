function [S] = SVGMsHat(sHat)
global m
%S = (1.0 - ( 1.0 - sHat).^(1/m)).^m;
S = (1.0 - (1.0 - sHat).^((1-m)/(2*m))).^(m);
return;