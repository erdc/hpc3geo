global q
global muw
global mun
global rhow
global rhon
global g
global n
global m
global ki
rhon  = 1.205  % kg/m^3
rhow  = 998.2  % kg/m^3
gc = -7.3156608e+10 % m / day^2
g = gc
%g=0.0
%muw = 0.1002   % kg /m s
muw = 8657.28   % kg /m day
%mun = 1.81e-05 % kg /m s
mun = 1.56384 % kg / m day
Conductivity = ki * rhow * abs(gc) / muw
%q = -0.8
%q = 0.0
%q=0.8
q=0.005
g=0.0
%n=1.3 %clay
%n=2.5 %sand
%n  = 1.31   % clay
%Ks = 0.062  % m/day clay
n  = 4.264 % sand
Ks = 5.04  % m/day sand
ki = Ks*muw/(abs(gc)*rhow)
m=1.0 - 1.0/n
%for i=1:4
%S=[0.0:.0001:1.0];
%S=[0.999:.000001:1.0];
figure(1)
plot(S,FvS2(S))
xlabel('S')
ylabel('F')
ttl = sprintf('Flux Function for VGM, n =%1.2f',n)
title(ttl);
figure(2)
%S=[0.9:0.0001:1.0]
hold on; plot(S,FpvS2(S))
xlabel('S')
ylabel('dF/dS')
ttl = sprintf('Characteristic Speeds for VGM, n =%1.2f',n)
title(ttl);

[min, FminVal, exitflag] = fminbnd(@FvS2,0.0,0.9999)
if exitflag
  if min > 0.1
    figure(1); hold on; plot(min,FminVal,'+')
  end
else
  min=0.0
end
%if n < 2
%  inflect=fzero(@FppvS2,[0.99,0.9999])
%  figure(1); hold on;
%  plot(inflect,FvS2(inflect),'*')
%elseif n > 2
if min > 0.01
  [inflect1, fval, exitflag]=fzero(@FppvS2,[0.1,min])
  if exitflag
    figure(1); hold on;
    plot(inflect1,FvS2(inflect1),'*')
  end
  if sign(FppvS2(min)) ~= sign(FppvS2(0.9999))
    [inflect2, fval, exitflag] =fzero(@FppvS2,[min,0.9999])
    if exitflag
      figure(1); hold on;
      plot(inflect2,FvS2(inflect2),'*')
    end
  end
else
  if sign(FppvS2(0.01)) ~= sign(FppvS2(0.99999))
    [inflect1, fval, exitflag]=fzero(@FppvS2,[0.01,0.99999])
    if exitflag
      figure(1); hold on;
      plot(inflect1,FvS2(inflect1),'*')
    end  
  end
end
%n=n+0.4
%m = 1.0 - 1.0/n
%end
