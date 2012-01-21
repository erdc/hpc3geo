function [M] = circleDaeMass(z,y)
u=y(1);
v=y(2);
M=zeros(2,2);
M(1,2) = 1.0;
return
