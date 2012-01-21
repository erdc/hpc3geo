close all
clear all
clear variables
S=[0.0:0.001:1.0];
global m
dm = 1.0/6;
for i=1:5
   m = i*dm;
   fms(i,:) = sprintf('m =%1.2f',m);
   sPlot(i,:) = S;
   fPlot(i,:) = -(krwVGM(S).*krnVGM(S)) ./ (krwVGM(S) + krnVGM(S));
   dPlot(i,:) = -(krwVGM(S).*krnVGM(S).*dpcVGM(S)) ./ (krwVGM(S) + krnVGM(S));
end
figure(1)
plot(sPlot',fPlot')
title('Van Genuchten - F vs. S');xlabel('S');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
figure(2)
plot(sPlot',dPlot')
title('Van Genuchten - D vs S');xlabel('S');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
