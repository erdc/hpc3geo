global q
global muw
global mun
global rhow
global rhon
global g
global n
global ki
rhon  = 1.205  % kg/m^3
rhow  = 998.2  % kg/m^3
g = -7.3156608e+10 % m / day^2
ki = 1.0e-9   % m^2 (sandy soil)
%ki = 1.0e-12   % m^2 (clay ?)
%muw = 0.1002   % kg /m s
muw = 8657.28   % kg /m day
%mun = 1.81e-05 % kg /m s
mun = 1.56384 % kg / m day
q = 0.0
%q=-0.8
%n=1.5
n=4.5
S=[0.9:.0001:1.0]
%S=[0.99:.0001:1.0]
figure(1)
plot(S,FvS(S))
figure(2)
%S=[0.9:0.0001:1.0]
plot(S,FpvS(S))
if n < 2
  inflect=fzero(@FpvS,[0.99,0.9999])
  figure(1); hold on;
  plot(inflect,FvS(inflect),'*')
elseif n > 2
  inflect1=fzero(@FpvS,[0.94,0.99])
  figure(1); hold on;
  plot(inflect1,FvS(inflect1),'*')
  inflect2=fzero(@FpvS,[inflect1+0.0001,0.9999])
  figure(1); hold on;
  plot(inflect2,FvS(inflect2),'*')
end