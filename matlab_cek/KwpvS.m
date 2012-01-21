function [K]=KwvS(S)
global n;
global ki;
global muw;
lami = ki/muw;
m=1.0 - 1.0/n;
K = lami.*(1.0./2.0./S.^(1.0./2.0).*(1.0-(1.0-S.^(1.0./m)).^m).^2.0+...
2.0./S.^(1.0./2.0).*(1.0-(1.0-S.^(1.0./m)).^m).*(1.0-S.^(1.0./m)).^m.*S.^(1.0./m)./(1.0-S.^(1.0./m)));
return;  