syms u p r 
r=1;
syms yp1r1 yp2r1 yp3r1 yp4r1 ;
p=1;
yp1r1 = int((p*u^(p-1))/(u - u^r))
p=2;
yp2r1 = int((p*u^(p-1))/(u - u^r))
p=3;
yp3r1 = int((p*u^(p-1))/(u - u^r))
p=4;
yp4r1 = int((p*u^(p-1))/(u - u^r))
syms yp1r2 yp2r2 yp3r2 yp4r2 ;
r=2;
p=1;
yp1r2 = int((p*u^(p-1))/(u - u^r))
p=2;
yp2r2 = int((p*u^(p-1))/(u - u^r))
p=3;
yp3r2 = int((p*u^(p-1))/(u - u^r))
p=4;
yp4r2 = int((p*u^(p-1))/(u - u^r))
