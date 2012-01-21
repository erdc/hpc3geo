function [K]=KwvS(S)
global n;
global ki;
global muw;
lami = ki/muw;
m=1.0 - 1.0/n;
K = lami*sqrt(S) .* ( 1.0 - ( 1.0 - S.^(1.0/m)).^(m)).^2 ;
return;  