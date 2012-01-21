u0 = 1.0
v0 = -1.0
w0=2.0
options = odeset('Jacobian',@ssDaeP3Jac,'Mass',@ssDaeP3Mass,'MassSingular','yes','InitialSlope',[v0 0 (1.0 + 1.0/p)*v0],'BDF','on');
[t,y]=ode15s(@ssDaeP3,[0:0.001:10],[u0;v0;w0],options);
%hold on,figure(1),plot(t,y(:,1),'x'),title('C')
%hold on,figure(2),plot(t,y(:,2),'x'),title('flux')
%hold on,figure(3),plot(t,y(:,3),'x'),title('C_s')
figure(1),plot(t,y(:,1),'x'),title('C')
figure(2),plot(t,y(:,2),'x'),title('flux')
figure(3),plot(t,y(:,3),'x'),title('C_s')
