function [f] = freeBound2(zStar)
global N;
global p;
global yR;
h = zStar/(N-1);
[y,its]=solveProfile(zStar,1.0e-6,50);
if its==50,
        f=1.0e6
else,
        f = ((y(N)^p - y(N-1)^p)/h)^2 + zStar + max(max(-y,0))^p;
end
return;