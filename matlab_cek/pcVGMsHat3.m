function [pc] = pcVGMsHat3(sHat)
global m
pc = ( ((3.0 - 4.0*m)/(1.0 - 3.0*m)).*(1.0 - sHat) ).^((1.0 - 3.0*m)/(3.0 - 4.0*m));
return