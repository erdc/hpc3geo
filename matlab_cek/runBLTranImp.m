global p;
global q;
global r;
global D;
global v;
global h;
global uL;
global uR;
%p=13.0;
p=1;
%q=1.0;
q=1;
%r=4.0/3.0;
r=1;
D=0.01
%v=0
v=1.0
uL=1.0
uR=0.0
if D > 0.0 & v>0,
        Pe = 2*D/v
        pfac=0.99
        he = pfac*Pe
        n=round(1.0/he)+1
else
        n=10
end
h=1.0/(n-1.0)
x=[0:h:1.0];
y0=zeros(2*n,1);
y0p=y0;
y0(1) = 1.0;
y0(n+1) = y0(1)^r;
tmp = blTran(0,y0);
y0p(n+2:2*n-1) = tmp(2:n-1);
r0 = blTranMass(0,y0)*y0p - blTran(0,y0);
tFac=0.99
if D > 0,
        k = tFac*h^2/(2*D)
else
        k = tFac*h/v
end
N=round(0.5/k)
nPrint=round(N/10.0);
yN=y0;
yNp1=y0;
t=0.0
M=blTranMass(t,yNp1); %constant matrix
predict=0
yNm1=yN;
fluxOut=zeros(N,1)
for i=1:N
        t=t+k
        if predict==1, 
            temp = k*blTran(t,yN);
            %explicit step for total mass
            yNp1(n+2:2*n-1) = yN(n+2:2*n-1) + temp(2:n-1);
            %initial guess for concentrations
            yNp1(2:n-1) = yN(2:n-1);
            for j=2:n-1,
                    res0 = yNp1(j)^r - yNp1(n+j);
                    res=res0;
                    its = 0;
                    while abs(res) > abs(res0)*1.0e-5 && its < 100,
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
        resV = M*(yNp1 - yN)/k - blTran(t,yNp1);
        resV0=resV;
        its = 0;
        normResV0=norm(resV0)
        normResV=normResV0
        while normResV > normResV0*1.0e-5 && its < 100,
                J = M/k - blTranJac(t,yNp1);
                yNp1 = yNp1 - J\resV;
                resV = M*(yNp1 - yN)/k - blTran(t,yNp1);
                normResV=norm(resV)
                its = its+1;
        end
        if its == 100,
                sprintf('Nonlinear System Solve Failed');
                its
        end
        yNm1=yN;
        yN=yNp1;
        if mod(i,nPrint) == 0,
                figure(3),hold on,plot(x',yNp1(1:n),'o-'),title('C')
                figure(4),hold on,plot(x',yNp1(n+1:2*n),'o-'),title('M')
        end
        fluxOut(i) =v*max(yNp1(n),0.0).^q;
end
size(fluxOut)
i=1;
y=yNp1';
figure(3),hold on,plot(x',y(i,1:n),'o-'),title('z')
figure(4),hold on,plot(x',y(i,n+1:2*n),'o-'),title('S')
figure(5),semilogy(fluxOut,'x');
p
q
r