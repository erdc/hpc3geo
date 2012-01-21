function [pc]=pcvSbc(S)
global lambda
pc=size(S);
[n,m] = size(S);
for i=1:n
for j=1:m
if S(i,j) < 1.0
pc(i,j) = (S(i,j))^(-1.0/lambda);
else
pc(i,j)=0.0;
end
end
end
return;
