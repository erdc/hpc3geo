function [K]=Knvpcvg(pc)
global n;
m=1.0 - 1.0/n;
K = sqrt((1.0 - (1.0 + pc.^n).^(-m))).*(pc.^(n-1) .* (1.0 + pc.^(n)).^(-m)).^(2.0);
return;