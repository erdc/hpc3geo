function [D] = DREVGMpcHat2(pcHat)
global m
D = (2.0*(1.0-m)/m).*(pcHat.^((2.0-3*m)/m)).* krwVGMpcHat2(pcHat);
return;