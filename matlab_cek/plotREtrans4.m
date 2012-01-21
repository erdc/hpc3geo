clear all
S = [0.9999:.0000001:1.0];
global m
dm = 1.0/10;
for i=1:9
   m = i*dm;
   pc = pcVGM(S);
   pcHat = pc.^(m/(2*(1-m)));
   fms(i,:) = sprintf('m =%1.2f',m);
   pcHatPlot(i,:) = 1.0 - pcHat./max(pcHat);
   sPlot(i,:) = S;
   phiMax = quad(@DREVGMpcHat2,pcHat(1),pcHat(length(pcHat)));
   phiPlot(i,1) = 0;
   for j=2:length(pcHat)-1
        phiPlot(i,j) = phiPlot(i,j-1) + quad(@DREVGMpcHat2,pcHat(j-1),pcHat(j));
   end
   phiPlot(i,length(pcHat)) = phiMax;
   phiPlot(i,:) = phiPlot(i,:) ./ phiMax;
   fPlot(i,:) = -krwVGMpcHat2(pcHat);
   dPlot(i,:) = DREVGMpcHat2(pcHat);
end
figure(1)
plot(pcHatPlot',sPlot')
title('Van Genuchten - S vs S^*');xlabel('\phi');ylabel('S')
%legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:));
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(2)
plot(pcHatPlot',fPlot')
title('Van Genuchten - F vs S^*');xlabel('S^*');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(3)
plot(pcHatPlot',dPlot')
title('Van Genuchten - D vs S^*');xlabel('S^*');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(4)
plot(phiPlot',sPlot')
title('Van Genuchten - S vs \phi');xlabel('\phi');ylabel('S')
%legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:));
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(5)
plot(phiPlot',fPlot')
title('Van Genuchten - F vs \phi');xlabel('\phi');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
%legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:));
