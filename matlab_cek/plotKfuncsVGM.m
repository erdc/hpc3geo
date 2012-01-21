clear variables;
S=[0.0:0.00001:1.0];
global m
dm = 1.0/5.0;
for i=1:4
  m = i*dm;
  kms(i,:) = sprintf('k_{rw}--m =%1.2f',m);
  kms(i+4,:) = sprintf('k_{rn}--m =%1.2f',m);
  s(i,:) = S;
  s(i+4,:) = S;
  gamma(i,:) = 1 - (1 - S.^(1/m)).^m;
  gamma(i+4,:) = 1 - (1 - S.^(1/m)).^m;
  kr(i,:) = krwVGM(S);
  kr(i+4,:) = krnVGM(S);
end
figure(1)
plot(s',kr')
title('Van Genuchten - Mualem Permeability');xlabel('S');ylabel('k_r')
legend(kms(1,:),kms(2,:),kms(3,:),kms(4,:),kms(5,:),kms(6,:),kms(7,:),kms(8,:))
figure(101)
plot(gamma',kr')
title('Van Genuchten - Mualem Permeability');xlabel('\gamma');ylabel('k_r')
legend(kms(1,:),kms(2,:),kms(3,:),kms(4,:),kms(5,:),kms(6,:),kms(7,:),kms(8,:))
figure(2)
clear fms;
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   gammaf(i,:) = 1 - (1 - S.^(1/m)).^m;
   fms(i,:) = sprintf('m =%1.2f',m);
   fng(i,:) = -krwVGM(S) ./ (krwVGM(S) + krnVGM(S));
end
plot(sf',fng')
title('Van Genuchten - Mualem Flux, v_t=-1, g=0 ');xlabel('S');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(102)
plot(gammaf',fng')
title('Van Genuchten - Mualem Flux, v_t=-1, g=0 ');xlabel('\gamma');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(3)
clear fms
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   fms(i,:) = sprintf('m =%1.2f',m);
   fg(i,:) = -(krwVGM(S).*krnVGM(S)) ./ (krwVGM(S) + krnVGM(S));
end
plot(sf',fg')
title('Van Genuchten - Mualem Flux, v_t=0, g=-1 ');xlabel('S');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(103)
plot(gammaf',fg')
title('Van Genuchten - Mualem Flux, v_t=0, g=-1 ');xlabel('\gamma');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(6)
clear fms
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   fms(i,:) = sprintf('m =%1.2f',m);
   D(i,:) = -(krwVGM(S).*krnVGM(S).*dpcVGM(S)) ./ (krwVGM(S) + krnVGM(S));
end
plot(sf',D')
title('Van Genuchten - Mualem Diffusivity');xlabel('S');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(106)
plot(gammaf',D')
title('Van Genuchten - Mualem Diffusivity');xlabel('\gamma');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(7)
clear fms
for i=1:4
   m = i*dm;
   pf(i,:) = pcVGM(S);
   fms(i,:) = sprintf('m =%1.2f',m);
   D(i,:) = -(krwVGM(S).*krnVGM(S).*dpcVGM(S)) ./ (krwVGM(S) + krnVGM(S));
end
semilogx(pf',D')
title('Van Genuchten - Mualem Diffusivity vs p_c');xlabel('p_c');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(8)
clear fms
for i=1:4
   m = i*dm;
   pf(i,:) = pcVGM(S);
   fms(i,:) = sprintf('m =%1.2f',m);
   fg(i,:) = (krwVGM(S).*krnVGM(S)) ./ (krwVGM(S) + krnVGM(S));
end
semilogx(pf',fg')
title('Van Genuchten - Mualem Flux vs p_c, v=0, g=1 ');xlabel('p_c');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(9)
clear fms
for i=1:4
   m = i*dm;
   pf(i,:) = pcVGM(S);
   fms(i,:) = sprintf('m =%1.2f',m);
   DT(i,:) = (krwVGM(S) + krnVGM(S));
end
semilogx(pf',DT')
title('Van Genuchten - DT vs p_c, v=0, g=1 ');xlabel('p_c');ylabel('DT')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
pc = [0:.001:2.0]
for i=1:4
   m = i*dm;
   fms(i,:) = sprintf('m =%1.2f',m);
   pcPlot(i,:) = pc;
   Spc(i,:) = sVGMpc(pc);
   krnpc(i,:) = krnVGMpc(pc);
   krwpc(i,:) = krwVGMpc(pc);
   fpc(i,:) = krwVGMpc(pc)./(krwVGMpc(pc) + krnVGMpc(pc));
   Dpc(i,:) = (krwVGMpc(pc).*krnVGMpc(pc))./(krwVGMpc(pc) + krnVGMpc(pc));
   DTpc(i,:) = (krwVGMpc(pc) + krnVGMpc(pc));
   DTS(i,:) = (krwVGM(Spc(i,:)) + krnVGM(Spc(i,:)));
   phi(i,:) = -quad(@krwVGMpc,10.0,pc)
end
figure(11)
plot(pcPlot',Spc')
title('Van Genuchten - S vs p_c');xlabel('p_c');ylabel('S')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(12)
plot(pcPlot',fpc')
title('Van Genuchten - f vs p_c');xlabel('p_c');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(13)
plot(pcPlot',Dpc')
title('Van Genuchten - D vs p_c');xlabel('p_c');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(14)
plot(pcPlot',DTpc')
title('Van Genuchten - D_t vs p_c');xlabel('p_c');ylabel('D_t')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(15)
plot(pcPlot',krnpc')
title('Van Genuchten - k_{rn} vs p_c');xlabel('p_c');ylabel('k_{rn}')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(16)
plot(pcPlot',krwpc')
title('Van Genuchten - k_{rw} vs p_c');xlabel('p_c');ylabel('k_{rw}')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(17)
plot(Spc',DTS')
title('Van Genuchten - D_t vs S');xlabel('S');ylabel('D_t')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))

sHat=[0.0:0.00001:1.0];
figure(201);
for i=1:4
   m = i*dm;
   fms(i,:) = sprintf('m =%1.2f',m);
   sPlot(i,:) = SVGMsHat(sHat);
   phiPlot(i,1) = 0
   for j=2:length(sHat)
        phiPlot(i,j) = phiPlot(i,j-1) + quad(@DBLVGMsHat,sHat(j-1),sHat(j))
   end
   FBLVGMsHatPlot(i,:) = FBLVGMsHat(sHat) 
end
