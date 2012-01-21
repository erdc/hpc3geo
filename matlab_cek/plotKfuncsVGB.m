clear variables;
S=[0.0:0.001:1.0];
global m
dm = 1.0/5.0;
for i=1:4
  m = i*dm;
  kms(i,:) = sprintf('k_{rw}--m =%1.2f',m);
  kms(i+4,:) = sprintf('k_{rn}--m =%1.2f',m);
  s(i,:) = S;
  s(i+4,:) = S;
  kr(i,:) = krwVGB(S);
  kr(i+4,:) = krnVGB(S);
end
figure(1)
plot(s',kr')
title('Van Genuchten - Burdine Permeability');xlabel('S');ylabel('k_r')
legend(kms(1,:),kms(2,:),kms(3,:),kms(4,:),kms(5,:),kms(6,:),kms(7,:),kms(8,:))
figure(2)
clear fms;
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   fms(i,:) = sprintf('m =%1.2f',m);
   fng(i,:) = krwVGB(S) ./ (krwVGB(S) + krnVGB(S));
end
plot(sf',fng')
title('Van Genuchten - Burdine Flux, v=1, g=0 ');xlabel('S');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(3)
clear fms
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   fms(i,:) = sprintf('m =%1.2f',m);
   fg(i,:) = (krwVGB(S).*krnVGB(S)) ./ (krwVGB(S) + krnVGB(S));
end
plot(sf',fg')
title('Van Genuchten - Burdine Flux, v=0, g=1 ');xlabel('S');ylabel('f')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
figure(4)
clear pcms
for i=1:4
   m = i*dm;
   spc(i,:) = S;
   pcms(i,:) = sprintf('m =%1.2f',m);
   pc(i,:) = pcVGB(S);
end
semilogy(spc',pc')
title('Van Genuchten - Burdine Capillary Pressure');xlabel('S');ylabel('p_c')
legend(pcms(1,:),pcms(2,:),pcms(3,:),pcms(4,:))
figure(5)
clear pcms
for i=1:4
   m = i*dm;
   spc(i,:) = S;
   pcms(i,:) = sprintf('m =%1.2f',m);
   dpc(i,:) = krwVGB(S).*dpcVGB(S);
end
semilogy(spc',dpc')
title('Van Genuchten - Burdine k_{rw} dp_c / dS');xlabel('S');ylabel('D')
legend(pcms(1,:),pcms(2,:),pcms(3,:),pcms(4,:))
figure(6)
clear fms
for i=1:4
   m = i*dm;
   sf(i,:) = S;
   fms(i,:) = sprintf('m =%1.2f',m);
   D(i,:) = (krwVGB(S).*krnVGB(S).*dpcVGB(S)) ./ (krwVGB(S) + krnVGB(S));
end
plot(sf',D')
title('Van Genuchten - Burdine Diffusivity');xlabel('S');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:))
