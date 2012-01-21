function [F]=FvS2(S)
global q
global m
global rhow
global rhon
global g
global muw
global mun
global ki
lamiw = ki/muw;
lamin = ki/mun;
F=(lamiw.*S.^(1./2).*(1-(1-S.^(1./m)).^m).^2.*q-lamiw.*S.^(1./2).*(1-(1-S.^(1./m)).^m).^2.*lamin.*(1-S).^(1./2).*(1-S.^(1./m)).^(2.*m).*(rhon-rhow).*g)./(lamiw.*S.^(1./2).*(1-(1-S.^(1./m)).^m).^2+lamin.*(1-S).^(1./2).*(1-S.^(1./m)).^(2.*m));
return;