U=[0.0:.0001:1.0];
Yp1q2 =-log(U)+log(U-1);
Yp2q2 =2*log(U-1);
Yp3q2 =3*U+3*log(U-1);
Yp4q2 =2*U.^2+4*U+4*log(U-1);
Yp1q1b2 =-log(U-1)+2*atanh(U.^(1/2));
Yp2q1b2 =-2*U-2*log(U-1)-4*U.^(1/2)+4*atanh(U.^(1/2));
Yp3q1b2 =-3/2*U.^2-3*U-3*log(U-1)-2*U.^(3/2)-6*U.^(1/2)+6*atanh(U.^(1/2));
Yp4q1b2 =-4/3*U.^3-2*U.^2-4*U-4*log(U-1)-8/5*U.^(5/2)-8/3*U.^(3/2)-8*U.^(1/2)+8*atanh(U.^(1/2));
figure(1);plot(Yp1q2,U,Yp2q2,U,Yp3q2,U,Yp4q2,U);
figure(2);plot(Yp1q1b2,U,Yp2q1b2,U,Yp3q1b2,U,Yp4q1b2,U);

 