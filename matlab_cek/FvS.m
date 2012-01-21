function [F]=FvS(S)
global q
global rhow
global rhon
global g
Kw = KwvS(S);
Kn = KnvS(S);
F = (q.*Kw - Kw.*Kn .* (rhon - rhow) .* g)./(Kw+Kn);
return;