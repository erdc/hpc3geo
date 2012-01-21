close all
clear all
clear variables
S=[0.5:0.001:1.0];
global m
dm = 1.0/6;
for i=1:5
   m = i*dm;
   fms(i,:) = sprintf('m =%1.2f',m);
   pcPlot(i,:) = pcVGM(S)./max(pcVGM(S));
   sPlot(i,:) = S(1,:);
   fPlot(i,:) = -krwVGM(S);
   dPlot(i,:) = -krwVGM(S);
   dPlotSform(i,:) = -krwVGM(S).*dpcVGM(S);
   fPlotScale(i,:) = -krwVGM(S)./(-(1.0 - (1.0-S).^m));
   dPlotSformScale(i,:) = -krwVGM(S).*(dpcVGM(S)./((1.0-S).^(-m)));
end
figure(1)
plot(pcPlot',fPlot')
title('Van Genuchten - F vs. p_c');xlabel('p_c');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
figure(2)
plot(pcPlot',dPlot')
title('Van Genuchten - D vs p_c');xlabel('p_c');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
figure(3)
plot(S',fPlot')
title('Van Genuchten - F vs. S');xlabel('S');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
figure(4)
plot(S',dPlotSform')
title('Van Genuchten - D vs S');xlabel('S');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
figure(5)
plot(sPlot',(fPlotScale)')
title('Van Genuchten - F/F* vs. S');xlabel('S');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
figure(6)
plot(sPlot',(dPlotSformScale)')
title('Van Genuchten - D/D* vs S');xlabel('S');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
