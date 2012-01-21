function f = fBuckLevSimpG(S,a)
f = S.^2 ./ ( S.^2 + a .* (1 - S).^2) - 9.8*S.^2 .* (1 - S).^2./ ( S.^2 + a .* (1 - S).^2);