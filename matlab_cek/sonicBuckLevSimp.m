function [g] = sonicBuckLevSimp(u,a,ur)
g = (fpBuckLevSimp(u,a) - (fBuckLevSimp(ur,a) - fBuckLevSimp(u,a))/(ur - u))^2