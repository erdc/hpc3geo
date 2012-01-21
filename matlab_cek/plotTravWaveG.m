clear variables;
global m
m =1.0/4.0
SL = 0.999;
for i=1:10
SR = i*.099;
DS = SL - SR;
S = [SR: DS/100000.0 : SL];
F = S;
D = S;
F(:) = (krwVGM(S).*krnVGM(S)) ./ (krwVGM(S) + krnVGM(S));
D(:) = -(krwVGM(S).*krnVGM(S).*dpcVGM(S)) ./ (krwVGM(S) + krnVGM(S));   
FL = F(length(S));
FR = F(1);
DF = FL - FR;
C = DF / DS
G = C.*((SL - S)./D)  - (FL - F)./ D;
figure
plot(S,G)
end