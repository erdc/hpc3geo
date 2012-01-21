function [M] = blTranMass(t,y)
m=length(y);
M=zeros(m,m);
n=m/2;
for i=2:n-1,
        M(i,n+i) = 1.0;
end
return