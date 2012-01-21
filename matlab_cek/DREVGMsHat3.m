function [D] = DREVGMsHat3(sHat)
D = krwVGMsHat3(sHat).*dpcVGMsHat3(sHat);
return;