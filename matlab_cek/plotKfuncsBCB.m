clear variables
S=[0.0:0.0001:1.0];
global lambda
dlambda = 1.0;
for i=1:4
  lambda = 0.1 + i*dlambda - 1.0;
  klambdas(i,:) = sprintf('k_{rw}--\\lambda =%1.2f',lambda);
  klambdas(i+4,:) = sprintf('k_{rn}--\\lambda =%1.2f',lambda);
  s(i,:) = S;
  s(i+4,:) = S;
  kr(i,:) = krwBCB(S);
  kr(i+4,:) = krnBCB(S);
end
figure(1)
plot(s',kr')
title('Brooks - Corey - Burdine Permeability');xlabel('S');ylabel('k_r')
legend(klambdas(1,:),klambdas(2,:),klambdas(3,:),klambdas(4,:),klambdas(5,:),klambdas(6,:),klambdas(7,:),klambdas(8,:))
figure(2)
clear flambdas
for i=1:4
   lambda = 0.1 + i*dlambda - 1.0;
   sf(i,:) = S;
   flambdas(i,:) = sprintf('\\lambda =%1.2f',lambda);
   fng(i,:) = krwBCB(S) ./ (krwBCB(S) + krnBCB(S));
end
plot(sf',fng')
title('Brooks - Corey - Burdine Flux, v=1, g=0 ');xlabel('S');ylabel('f')
legend(flambdas(1,:),flambdas(2,:),flambdas(3,:),flambdas(4,:))
figure(3)
clear flambdas
for i=1:4
   lambda = 0.1 + i*dlambda - 1.0;
   sf(i,:) = S;
   flambdas(i,:) = sprintf('\\lambda =%1.2f',lambda);
   fg(i,:) = (krwBCB(S).*krnBCB(S)) ./ (krwBCB(S) + krnBCB(S));
end
plot(sf',fg')
title('Brooks - Corey - Burdine Flux, v=0, g=1 ');xlabel('S');ylabel('f')
legend(flambdas(1,:),flambdas(2,:),flambdas(3,:),flambdas(4,:))
