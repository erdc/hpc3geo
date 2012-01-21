function [F] = FBLVGMsHat(sHat)
S = SVGMsHat(sHat);
F = -(krwVGM(S).*krnVGM(S)) ./ (krwVGM(S) + krnVGM(S));
return;