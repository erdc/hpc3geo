function [pc]=pcvSvg(S)
global n;
m=1.0 - 1.0/n;
pc = ( (S.^(-1.0/m)) - 1.0).^(1/n) ;
return;
