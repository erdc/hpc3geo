close all
clear all
clear variables
S=[0.5:0.001:1.0];
global m
dm = 1.0/6;
for i=1:5
   m = i*dm;
   fms(i,:) = sprintf('m =%1.2f',m);
   pcPlot(i,:) = pcVGM(S).^(m/(1-m));
   pcPlot(i,:) = pcPlot(i,:)./max(pcPlot(i,:));
   fPlot(i,:) = -krwVGM(S);
   dPlot(i,:) = -krwVGM(S)./((m/(1-m)).*pcVGM(S).^(m/(1-m)-1));
end
figure(1)
plot(pcPlot',fPlot')
title('Van Genuchten - F vs. p_c');xlabel('p_c');ylabel('F')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
figure(2)
plot(pcPlot',dPlot')
title('Van Genuchten - D vs p_c');xlabel('p_c');ylabel('D')
legend(fms(1,:),fms(2,:),fms(3,:),fms(4,:),fms(5,:))
