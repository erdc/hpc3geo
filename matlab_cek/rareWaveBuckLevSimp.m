function [g] = rareWaveBuckLevSimp(u,a,s)
g = s - fpBuckLevSimp(u,a)