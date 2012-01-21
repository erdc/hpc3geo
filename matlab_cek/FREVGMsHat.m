function [F] = FREVGMsHat(sHat)
S = SVGMsHat(sHat);
F = -krwVGM(S);
return;