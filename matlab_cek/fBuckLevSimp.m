function f = fBuckLevSimp(S,a)
f = S.^2 ./ ( S.^2 + a .* (1 - S).^2);