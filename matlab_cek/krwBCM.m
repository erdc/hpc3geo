function [krw] = krwBCM(S)
global lambda
krw = S.^( (4.0 + 5.0*lambda)/ (2.0*lambda))
return;