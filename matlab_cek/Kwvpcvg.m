function [K]=Kwvpcvg(pc)
global m;
n=1.0/(1.0-m);
K = ((1.0 - (pc.^(n-1.0)) .* ((1.0 + pc.^n).^(-m))).^2)./((1.0 + pc.^n).^(m/2));
return;