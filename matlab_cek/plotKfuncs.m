S=[0.0:0.001:1.0];
global m
dm = 1.0/5.0;
for i=1:4
  m = i*dm;
  kms(i,:) = sprintf('k_{rw}--m =%1.2f',m);
  kms(i+4,:) = sprintf('k_{rn}--m =%1.2f',m);
  s(i,:) = S;
  s(i+4,:) = S;
  gamma(i,:) = (1 - S.^(1/m)).^m;
  gamma(i+4,:) = (1 - S.^(1/m)).^m;
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
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   gammaf(i,:) = (1 - S.^(1/m)).^m;
   fms(i,:) = sprintf('f--m =%1.2f',m);
   fng(i,:) = krwVGM(S) ./ (krwVGM(S) + krnVGM(S));
end
plot(sf',fng')
title('Van Genuchten - Mualem Flux, v=1, g=0 ');xlabel('S');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(102)
plot(gammaf',fng')
title('Van Genuchten - Mualem Flux, v=1, g=0 ');xlabel('\gamma');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(3)
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   fms(i,:) = sprintf('f--m =%1.2f',m);
   fg(i,:) = (krwVGM(S).*krnVGM(S)) ./ (krwVGM(S) + krnVGM(S));
end
plot(sf',fg')
title('Van Genuchten - Mualem Flux, v=0, g=1 ');xlabel('S');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
plot(sf',fg')
title('Van Genuchten - Mualem Flux, v=0, g=1 ');xlabel('S');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
