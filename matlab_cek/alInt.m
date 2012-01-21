function [ir]=alInt(S)
ir =   (krwVGM(S).*krnVGM(S).*dpcVGM(S)) ./ (0.0001*krwVGM(S) + krnVGM(S)) ./ (1.0 - S);