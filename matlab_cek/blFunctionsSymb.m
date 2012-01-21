syms m S krn krw dpc D F a u uHat
%uHat = (1/m)^(2*m) * u^(1/2 + 2*m)
u = (m^(2*m)*uHat)^(1 / (1/2 + 2*m));
S = (1.0 - u)
dS = diff(S)
krw = sqrt(S)*(1.0 - (1.0 - S^(1.0/m))^m)^2;
krn = sqrt(1.0 - S)*(1.0 - S^(1.0/m))^(2.0*m);
%dpc = ((m-1)/(m*a))*(S^(-1/m) - 1)^(-m) * (S^(-1/m -1 ))
%D = (krw*krn*dpc)/(krw + krn)
F = -(krw*krn)/(krw + krn)
dF = diff(F)
