function [F]=FpvS(S)
global q
global rhow
global rhon
global g
Kw = KwvS(S);
Kn = KnvS(S);
Kwp = KwpvS(S);
Knp = KnpvS(S);
F = ((Kw+Kn).*(q.*Kwp                  ...
- Kwp.*Kn .* (rhon - rhow) .* g        ...
- Kw.*Knp .* (rhon - rhow) .* g)       ...
- (q.*Kw - Kw.*Kn .* (rhon - rhow) .* g).*(Kwp+Knp))./(Kw+Kn).^2;
return;