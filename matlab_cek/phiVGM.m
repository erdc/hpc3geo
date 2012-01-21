function [phi] = phiVGM(SIn)
global phi_Spline;
global S_Spline;
S = max(0.0,min(SIn,1.0));
phi = interp1(S_Spline,phi_Spline,S);
return;

