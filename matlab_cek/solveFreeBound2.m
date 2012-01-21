global zMax
global N
zStar = fminbnd(@freeBound2,0.5,zMax,optimset('MaxIter',100,'TolX',1.0e-5,'TolFun',1.0e-5));
h = zStar/(N-1);
z = [0:h:zStar]';
y = solveProfile(zStar,1.0e-6,1000);
figure(3);plot(z,y,'o-'),title('C_s');
figure(4);plot(z,y.^p,'o-'),title('C');