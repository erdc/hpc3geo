function [y,its] = solveProfile(zStar,tol,maxits)
global p;
global yL;
global yR;
global N;
global Z;
global Y;
h = zStar/(N-1);
z = [0:h:zStar]';
y=z;
y = interp1(Z,Y,z,'linear');
F0=profileF(y,zStar);
res0 = norm(F0);
res=res0;
F=F0
its=0
while res > res0*tol + tol && its < maxits,
        its=its+1
        J = profileJac(y,zStar);
        y = y - J\F;
        F = profileF(y,zStar);
        res=norm(F)
end
return;