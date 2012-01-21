function [K]=KnvS(S)
global n;
global ki;
global mun;
lami= ki/mun;
m=1.0 - 1.0/n;
K = lami.*(-1.0./2.0./(1.0-S).^(1.0./2.0).*(1.0-S.^(1.0./m)).^(2.0.*m)-...
2.0.*(1.0-S).^(1.0./2.0).*(1.0-S.^(1.0./m)).^(2.0.*m).*S.^(1.0./m)./S./(1.0-S.^(1.0./m)));
return;