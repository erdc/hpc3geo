function [dpc] = dpcVGMsHat3(sHat)
global m
dpc = (1.0 - sHat).^( (3.0*m - 2.0) / (3.0 - 4.0*m) );
return