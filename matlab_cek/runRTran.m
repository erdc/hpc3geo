global p;
global D;
global v;
global K;
global h;
global uL;
global uR;
%r=3/4
%r=3/4
r=1.0
p=1.0/r
D=0.01
v=1.0
K=1.0
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
y0(n+1) = y0(1)^p + K*y0(1);
y0p = rTran(0,y0);
r0 = rTranMass(0,y0)*y0p - rTran(0,y0);
options = odeset('Jacobian',@rTranJac,'Mass',@rTranMass,'MassSingular','yes','InitialSlope',y0p,'BDF','on','RelTol',1.0e-3,'AbsTol',1.0e-3,'Stats','on')%,'MaxOrder',1);
T=[0 1.0]
%[t,y]=ode15s(@rTran,T,y0,options);
[t,y]=ode23t(@rTran,T,y0,options);
i=size(y,1)
hold on;figure(1),plot(x,y(i,1:n),'o-'),title('C')
hold on;figure(2),plot(x,y(i,n+1:2*n),'o-'),title('M')
