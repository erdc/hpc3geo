syms m S krn krw dpc D F a u uHat
%uHat = 2*(1/m)^(m) * u^m
u = 0.5*(m^m)*(uHat^(1/m))
S = (1.0 - u)
krw = sqrt(S)*(1.0 - (1.0 - S^(1.0/m))^m)^2
dpc = ((m-1)/(m*a))*(S^(-1/m) - 1)^(-m) * (S^(-1/m -1 ))
D = -krw*dpc*diff(S)
F = -krw
dF = diff(F)
dD = diff(D)

