function [K]=Kwvpcvg(gam)
global n;
m=1.0 - 1.0/n;
K = ((1.0 - gam .* ((1.0 + gam.^(n/(n-1.0))).^(-m))).^2)./((1.0 + gam.^(n/(n-1.0))).^(m/2));
return;