function [krn] = krnBCB(S)
global lambda
krn = (1.0 - S).^2 .* (1.0 - S.^((2.0 + lambda)/lambda));
return;