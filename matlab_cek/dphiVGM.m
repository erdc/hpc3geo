function [dphi] = dphiVGM(SIn)
global dphi_Spline;
global dS_Spline;
S = max(0.0,min(SIn,1.0));
dphi = interp1(dS_Spline,dphi_Spline,S);
return;

