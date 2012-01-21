function [dphi] = bldPhi(u)
dphi = dphiVGM(blS(u)).*bldS(u);
return;