function [D] = DREVGMsHat(sHat)
S = SVGMsHat(sHat);
D = -krwVGM(S).*dpcVGM(S).*dSVGMsHat(sHat);
return;