function [krn] = krnBCM(S)
global lambda
krn = sqrt(1.0 - S).*(1.0 - S.^((1.0 + lambda)/lambda)).^2
return;