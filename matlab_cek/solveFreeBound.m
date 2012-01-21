global p
global yL
global yR
p=1.0
yL=1.0
yR=0.0
N=50
z0 = 5.0
h=z0/(N-1.0);
y=zeros(N+1,1);
y(N+1) = 5.0;
for i=1:N,
        y(i)=yL - (i-1)*h/z0;
end
y
f0=freeBound(y);
res0 = norm(freeBound(y));
res=res0;
f=f0;
y = fminsearch(@freeBoundLSred,y,optimset('MaxIter',10000));
zStar=y(N+1);
h = zStar/(N-1);
x = [0:h:zStar]';
plot(x,y(1:N));
%while res > res0*1.0e-5,
%        J = freeBoundJac(y)
%        y = y - J\f
%        f = freeBound(y);
%        res=norm(f)
%end


