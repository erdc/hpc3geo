function [D] = FBLVGMsHat(sHat)
S = SVGMsHat(sHat);
D = -(krwVGM(S).*krnVGM(S).*dpcVGM(S).*dSVGMsHat(sHat)) ./ (krwVGM(S) + krnVGM(S));
return;