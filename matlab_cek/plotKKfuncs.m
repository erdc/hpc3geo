global m 
dm = 1.0/5.0;
pc = [0.0:.001:2.0];
for i=1:4
  m = i*dm;
  n = 1.0/(1.0-m);
  pcp(i,:) = pc;
  L = length(pc);
  pcLast=2.1;
  phiD = -quad(@Kwvpcvg,10,0.0);
  phi0 = -quad(@Kwvpcvg,10,pcLast);
  for j=1:L
    phi(i,L-j+1) = phi0 - quad(@Kwvpcvg,pcLast,pc(L-j+1));
    pcLast = pc(L-j+1);
    phi0 = phi(i,L-j+1);
  end
  phi(i,:) = phi(i,:)./phiD;
  Sp(i,:) = (1.0 + pc.^n).^(-m);
  kwp(i,:) = krwVGM(Sp(i,:)); 
end
plot(pcp',phi')
figure;
plot(phi',Sp')
figure;
plot(phi',kwp')