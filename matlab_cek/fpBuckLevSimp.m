function fp = fpBuckLevSimp(S,a)
fp = 2.*S./(S.^2+a.*(1-S).^2)-S.^2./(S.^2+a.*(1-S).^2).^2.*(2.*S-2.*a.*(1-S))