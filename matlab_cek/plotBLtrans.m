close all
clear all
clear variables
sHat=[0.0:0.001:1.0];
global m
dm = 1.0/10.0;
for i=1:9
   m = i*dm;
   fms(i,:) = sprintf('m =%1.2f',m);
   sPlot(i,:) = SVGMsHat(sHat);
   phiMax = quad(@DBLVGMsHat,0.00001,0.999);
   phiPlot(i,1) = 0;
   phiPlot(i,2) = quad(@DBLVGMsHat,0.00001,0.001);
   for j=3:length(sHat)-1
        phiPlot(i,j) = phiPlot(i,j-1) + quad(@DBLVGMsHat,sHat(j-1),sHat(j));
   end
   phiPlot(i,length(sHat)) = phiMax;
   phiPlot(i,:) = phiPlot(i,:) ./ phiMax;
   fPlot(i,:) = FBLVGMsHat(sHat);
   krwPlot(i,:) = krwVGMsHat(sHat);
   krnPlot(i,:) = krnVGMsHat(sHat);
end
figure(1)
plot(phiPlot',sPlot')
title('Van Genuchten - S vs \phi');xlabel('\phi');ylabel('S')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(2)
plot(phiPlot',fPlot')
title('Van Genuchten - f vs \phi');xlabel('\phi');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(3)
plot(sHat',krwPlot')
title('Van Genuchten - k_{rw} vs \phi');xlabel('\phi');ylabel('k_{rw}')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
figure(4)
plot(sHat',krnPlot')
title('Van Genuchten - k_{rn} vs \phi');xlabel('\phi');ylabel('k_{rn}')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:),fms(6,:),fms(7,:),fms(8,:),fms(9,:))
