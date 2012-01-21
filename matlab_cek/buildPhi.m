dS = 1.0/(nSpline - 1.0);
global phi_Spline;
global dphi_Spline;
global S_Spline;
global dS_Spline;
S_Spline = [0:dS:1.0];
dS_Spline = [-dS/2:dS:1.0+dS/2];
phi_Spline=S_Spline;
dphi_Spline=dS_Spline;
phi_Spline(1) = 0.0;
for i=2:nSpline,
phi_Spline(i) = phi_Spline(i-1) + quad(@DVGM,S_Spline(i-1),S_Spline(i));
end
dphi_Spline(1) = 0.0;
for i=2:nSpline,
dphi_Spline(i) = (phi_Spline(i) - phi_Spline(i-1)) / dS;
end
dphi_Spline(nSpline+1) = 0.0;
figure(1); plot(S_Spline,interp1(S_Spline,phi_Spline,S_Spline,'linear'),'x',S_Spline,phi_Spline,'-');
figure(2); plot(S_Spline,interp1(dS_Spline,dphi_Spline,S_Spline,'nearest'),'x',S_Spline,DVGM(S_Spline));