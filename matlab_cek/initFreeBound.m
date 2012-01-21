global p
global yL
global yR
global N
global Y
global Z
global zMax
p=2.5
yL=1.0
yR=0.0
N=50
zMax=2.0
h = zMax/(N-1);
Z = [0:h:zMax]';
y=zeros(N,1);
Y=y;
for i=1:N,
        Y(i)=yL - (i-1)*h/zMax;
end
interp1(Z,Y,Z)
[Y,its] = solveProfile(zMax,1.0e-6,1000);
figure(1);plot(Z,Y,'o-'),title('C_s');
figure(2);plot(Z,Y.^p,'o-'),title('C');
