global h;
global uL;
global uR;
global vgm;
global vga;
global uMax;
%vga = 1.0;
vgm=1.0/5.0;
global m;
m=vgm;
nSpline = 1000;
buildPhi;
uMax = (vgm^(-2*vgm))^(1/2 + 2*vgm);
uTest=[0:uMax/100.0:uMax];
figure(101),plot(uTest,blS(uTest)),title('S vs. u');
figure(102),plot(uTest,bldS(uTest)),title('dS/du vs. u');
figure(103),plot(uTest,blPhi(uTest)),title('\phi vs. u');
figure(104),plot(uTest,bldPhi(uTest)),title(' d\phi/du vs. u');
figure(105),plot(uTest,blF(uTest)),title('F vs. u');
figure(106),plot(uTest,bldF(uTest)),title('dF/du vs. u');
figure(203),plot(blS(uTest),blPhi(uTest)),title('\phi vs. u');
figure(204),plot(blS(uTest),bldPhi(uTest)),title(' d\phi/du vs. u');
figure(205),plot(blS(uTest),blF(uTest)),title('F vs. u');
figure(206),plot(blS(uTest),bldF(uTest)),title('dF/du vs. u');
return;
uL=uMax;
uR=0.0     
n=101.0
h=1.0/(n-1.0)
x=[0:h:1.0];
y0=zeros(2*n,1);
y0p=y0;
y0(1:n/2) = uL;
y0(n+1:2*n) = blS(y0(1:n));
tmp = blTranReal(0,y0);
y0p(n+2:2*n-1) = tmp(2:n-1);
r0 = blTranMass(0,y0)*y0p - blTranReal(0,y0);
tFac=0.99
k = 1.0/1000;
N=1000;
nPrint=round(N/5.0)
yN=y0
yNp1=y0;
t=0.0
M=blTranMass(t,yNp1); %constant matrix
predict=0;
yNm1=yN;
fluxOut=zeros(N,1);
%options = odeset('Jacobian',@blTranJac,'Mass',@blTranMass,'MassSingular','yes','InitialSlope',y0p,'BDF','on','RelTol',1.0e-3,'AbsTol',1.0e-3,'Stats','on')%,'MaxOrder',1);
%options = odeset('Mass',@blTranMass,'MassSingular','yes','InitialSlope',y0p,'BDF','on','RelTol',1.0e-3,'AbsTol',1.0e-3,'Stats','on')%,'MaxOrder',1);
%T=[0 0.5]
%[t,y]=ode15s(@blTranReal,T,y0,options);
%[t,y]=ode23t(@blTran,T,y0,options);
%i=size(y,1)
%hold on;figure(1),plot(x,y(i,1:n),'o-'),title('C')
%hold on;figure(2),plot(x,y(i,n+1:2*n),'o-'),title('M')
%return
figure(1),hold on,plot(x',yN(1:n),'o-'),title('z')
figure(2),hold on,plot(x',yN(n+1:2*n),'o-'),title('S')
y=zeros(n,6);
xx=y;
myPrint=1;
y(:,myPrint)=yN(n+1:2*n);
xx(:,myPrint) = x';
for i=1:N
        t=t+k
        if predict==1, 
            temp = k*blTranReal(t,yN);
            %explicit step for total mass
            yNp1(n+2:2*n-1) = yN(n+2:2*n-1) + temp(2:n-1);
            %initial guess for concentrations
            yNp1(2:n-1) = yN(2:n-1);
            for j=2:n-1,
                    res0 = yNp1(j)^r - yNp1(n+j);
                    res=res0;
                    its = 0;
                    while abs(res) > abs(res0)*1.0e-5 +1.0e-5 && its < 100,
                            yNp1(j) = yNp1(j) - res/(r*yNp1(j)^(r-1));
                            res = yNp1(j)^r - yNp1(n+j);
                            its = its+1;
                    end
                    if its==100,
                            sprintf('Scalar Nonlinear Solve Failed')
                            its
                    end
            end
        else
                yNp1=yN+k*(yN-yNm1);
        end     
        %now do implicit
        resV = M*(yNp1 - yN)/k - blTranReal(t,yNp1);
        resV0=resV;
        its = 0;
        normResV0=norm(resV0);
        normResV=normResV0;
        while normResV > normResV0*1.0e-5 && its < 100,
                J = M/k - blTranJacReal(t,yNp1);
                yNp1 = yNp1 - J\resV;
                resV = M*(yNp1 - yN)/k - blTranReal(t,yNp1);
                normResV=norm(resV);
                its = its+1;
        end
        if its == 100,
                sprintf('Nonlinear System Solve Failed');
                its
        end
        yNm1=yN;
        yN=yNp1;
        if mod(i,nPrint) == 0,
                figure(1),hold on,plot(x',yNp1(1:n),'o-'),title('z');
                figure(2),hold on,plot(x',yNp1(n+1:2*n),'o-'),title('S');
        end
        if i==1 || i==10 || i==100 || i==1000,
                myPrint=myPrint+1
                xx(:,myPrint) = x';
                y(:,myPrint) = yNp1(n+1:2*n);
        end
        fluxOut(i) =blF(yNp1(n));
end
myPrint=myPrint+1
xx(:,myPrint) = x';
y(:,myPrint) = yNp1(n+1:2*n);
size(fluxOut)
figure(1),hold on,plot(x',yNp1(1:n),'o-'),title('z');
figure(2),hold on,plot(x',yNp1(n+1:2*n),'o-'),title('S');
figure(3),semilogy(fluxOut,'x');
figure(4),plot(xx,y);
