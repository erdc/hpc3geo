function [krw] = krwVGMsHat3(sHat)
global m
pc = pcVGMsHat3(sHat);
krw = (1.0 - pc.^(m/(1.0-m)) .* (1.0 + pc.^(1.0/(1.0-m))).^(-m)).^2.0 .* (1.0 + pc.^(1.0/(1.0-m))).^(-m/2.0);
return;