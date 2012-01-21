function [D] = DVGM(S)
krw = krwVGM(S);
krn = krnVGM(S);
dpc = dpcVGM(S);
numer = max(-krw.*krn.*dpc,0.0);
D = numer./(krw + krn);
return;