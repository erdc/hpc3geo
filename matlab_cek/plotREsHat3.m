clear all
sHat = [-2.0:.1:1.0];
global m
dm = 1.0/10;
for i=1:9
   m = i*dm;
   fms(i,:) = sprintf('m =%1.2f',m);
   sPlot(i,:) = sHat;
   pc = pcVGMsHat3(sHat)
   phiMax = quad(@DREVGMsHat3,sHat(1),sHat(length(sHat)));
   phiPlot(i,1) = 0;
   for j=2:length(sHat)-1
        phiPlot(i,j) = phiPlot(i,j-1) + quad(@DREVGMsHat3,sHat(j-1),sHat(j));
   end
   phiPlot(i,length(sHat)) = phiMax;
   phiPlot(i,:) = phiPlot(i,:) ./ phiMax;
   fPlot(i,:) = -krwVGMsHat3(sHat);
   dPlot(i,:) = DREVGMsHat3(sHat);
end
figure(1)
plot(sPlot',sPlot')
title('Van Genuchten - S vs S^*');xlabel('\phi');ylabel('S')
%legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:));
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(2)
plot(sPlot',fPlot')
title('Van Genuchten - F vs S^*');xlabel('S^*');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(3)
plot(sPlot',dPlot')
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
