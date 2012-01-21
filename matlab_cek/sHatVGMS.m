function [sHat] = sHatVGMS(S)
global m
sHat = 1.0 - (1.0 - S.^(1/m)).^m
return;