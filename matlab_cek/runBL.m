global p;
global q;
global r;
global D;
global v;
global h;
global uL;
global uR;
p=1.0;
q=1.0;
r=2.0;
%D=0.01
D=0.01
%v=0
v=1.0
uL=1.0
uR=0.0
if D > 0.0 & v>0,
        Pe = 2*D/v
        pfac=0.5
        he = pfac*Pe
        n=round(1.0/he)+1
else
        n=50
end
h=1.0/(n-1.0)
x=[0:h:1.0];
y0=zeros(2*n,1);
y0p=y0;
y0(1) = 1.0;
y0(n+1) = y0(1)^r;
tmp = blTran(0,y0);
y0p(n+2:2*n-1) = tmp(2:n-1);
r0 = blTranMass(0,y0)*y0p - blTran(0,y0)
options = odeset('Jacobian',@blTranJac,'Mass',@blTranMass,'MassSingular','yes','InitialSlope',y0p,'BDF','on','RelTol',1.0e-3,'AbsTol',1.0e-3,'Stats','on')%,'MaxOrder',1);
T=[0 0.5]
[t,y]=ode15s(@blTran,T,y0,options);
%[t,y]=ode23t(@blTran,T,y0,options);
i=size(y,1)
hold on;figure(1),plot(x,y(i,1:n),'o-'),title('C')
hold on;figure(2),plot(x,y(i,n+1:2*n),'o-'),title('M')
