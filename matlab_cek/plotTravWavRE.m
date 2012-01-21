clear variables;
global m
dm =1.0/6.0
SL = 1.0;
for i=1:5
m=i*dm
figure(i)
hold  on;
for j=1:5
SR = 0.99 - (j-1)*0.1
DS = SL - SR;
S = [SR: DS/1000.0 : SL];
F = S;
D = S;
F(:) = -krwVGM(S);
D(:) = -krwVGM(S).*dpcVGM(S);
FL = F(length(S));
FR = F(1);
DF = FL - FR;
C = DF / DS
G = C.*((SL - S)./D)  - (FL - F)./ D;
plot(S,G)
end
end