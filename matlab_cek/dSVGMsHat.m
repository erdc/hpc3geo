function [dS] = dSVGMsHat(sHat)
global m
%dS =  (1.0 - (1.0 - sHat).^(1/m)).^(m-1).*(1.0 - sHat).^(1.0/m - 1.0);
dS =  (1.0 - (1.0 - sHat).^((1-m)/(2*m))).^(m-1).*(1.0 - sHat).^((1.0-m)/(2*m) - 1.0);
return;