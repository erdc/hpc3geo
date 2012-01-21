u0 = 1.0
v0 = -10
options = odeset('Jacobian',@ssDaePJac,'Mass',@ssDaeMassM,'MassSingular','yes','InitialSlope',[0 v0 2*v0],'BDF','on','InitialStep',.0001);
[t,y]=ode15s(@ssDaeP,[0:0.001:10],[u0;v0;2*u0],options);
figure(1),plot(t,y(:,1),'x')
figure(2),plot(t,y(:,2),'x')
figure(3),plot(t,y(:,3)-y(:,1),'x')