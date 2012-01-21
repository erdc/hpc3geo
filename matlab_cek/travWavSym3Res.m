U=[0.0:.0001:1.0];
Yp1r2 =log(U)-log(U-1)
Yp2r2 =-2*log(U-1)
Yp3r2 =-3*U-3*log(U-1)
Yp4r2 =-2*U.^2-4*U-4*log(U-1)
figure(1);plot(Yp1r2,U,Yp2r2,U,Yp3r2,U,Yp4r2,U);
