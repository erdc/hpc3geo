function [krw] = krwVGMpcHat(pcHat)
global m
krw = (1.0 - pcHat.* (1.0 + pcHat.^(1/m)).^(-m)).^2.0 .* (1.0 + pcHat.^(1/m)).^(-m/2.0);
return;