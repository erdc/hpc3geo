u0 = 1.0
v0 = -1.0
w0=u0^p
options = odeset('Jacobian',@ssDaeP4Jac,'Mass',@ssDaeP4Mass,'MassSingular','yes','InitialSlope',[v0/p 0 v0],'BDF','on');
[t,y]=ode15s(@ssDaeP4,[0:0.001:10],[u0;v0;w0],options);
%hold on,figure(1),plot(t,y(:,1),'x'),title('C')
%hold on,figure(2),plot(t,y(:,2),'x'),title('flux')
%hold on,figure(3),plot(t,y(:,3),'x'),title('C_s')
figure(1),plot(t,y(:,1),'x'),title('u')
figure(2),plot(t,y(:,2),'x'),title('v')
figure(3),plot(t,y(:,3),'x'),title('w')
