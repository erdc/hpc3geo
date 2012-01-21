function [D] = DREVGMpcHat(pcHat)
global m
D = ((1.0-m)/m).*(pcHat.^((1-2*m)/m)).* krwVGMpcHat(pcHat);
return;