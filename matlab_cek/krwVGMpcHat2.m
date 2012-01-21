function [krw] = krwVGMpcHat2(pcHat)
global m
krw = (1.0 - pcHat.^2 .* (1.0 + pcHat.^(2/m)).^(-m)).^2.0 .* (1.0 + pcHat.^(2/m)).^(-m/2.0);
return;