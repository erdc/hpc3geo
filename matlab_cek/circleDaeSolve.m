u0 = 1.0/sqrt(2);
v0 = 1.0/sqrt(2);
u0 = 1.0;
v0 = 0.0;
options = odeset('Jacobian',@circleDaeJac,'Mass',@circleDaeMass,'MassSingular','yes','InitialSlope',[v0;u0],'BDF','on','InitialStep',1.0e-2,'MaxStep',2.0*pi/1000.0,'Stats','on');
[t,y]=ode15s(@circleDae,[0:(2*pi)/100.0:2*pi],[u0;v0],options);
%hold on,figure(1),plot(t,y(:,1),'x'),title('C')
%hold on,figure(2),plot(t,y(:,2),'x'),title('flux')
%hold on,figure(3),plot(t,y(:,3),'x'),title('C_s')
figure(1),plot(t,y(:,1),'x'),title('u')
figure(2),plot(t,y(:,2),'x'),title('v')
