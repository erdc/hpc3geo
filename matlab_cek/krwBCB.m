function [krw] = krwBCM(S)
global lambda
krw = S.^( (2.0 + 3.0*lambda)/ lambda);
return;