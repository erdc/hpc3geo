function [D]=DvS(S)
global n;
m=1.0 - 1.0/n;
Kw = KwvS(S);
Kn = KnvS(S);
numer = Kn .* Kw .* ( (-1.0/(n*m)) .* (( S.^(-1.0/m) -1.0 ).^(1.0/n-1.0)).* (S.^(-1.0/m-1.0)));
D = numer ./ (Kn+Kw);
return;