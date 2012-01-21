function [x,u] = buckLevSol(t,ul,ur,a,inflect)
x(1) = -1.0
u(1) = ul
if t==0.0
        x(2) = 0.0
        u(2) = ul
        x(3) = 0.0
        u(3) = ur
        x(4) = 1.0
        u(4) = ur
        return
end
ful = fBuckLevSimp(ul,a) 
fur = fBuckLevSimp(ur,a)
fpul = fpBuckLevSimp(ul,a) 
fpur = fpBuckLevSimp(ur,a)
if ur < inflect
  s = (ful - fur)/(ul - ur)
  if fpul >= s %shock
     x(2) = s*t
     u(2) = ul
     x(3) = s*t
     u(3) = ur
     x(4) = 1.0
     u(4) = ur 
  else
     sonicPoint = fminbnd(@sonicBuckLevSimp,inflect,ul,[],a,ur)
     fpSonicPoint=fpBuckLevSimp(sonicPoint,a)
     x(2) = fpul*t
     u(2) = ul
     x(12+1) = fpSonicPoint*t
     u(12+1) = sonicPoint
     x(12+2) = fpSonicPoint*t
     u(12+2) = ur
     x(12+3) = 1.0
     u(12+3) = ur
     dx = (x(12+1) - x(2))/9.0
     for i=1:10
       x(2+i) = (i-1.0)*dx + x(2)
       s = x(2+i)/t
       u(2+i) = u(2+i-1) 
       u(2+i) = fzero(@rareWaveBuckLevSimp,u(2+i),[],a,s)
     end
  end
else
     %rarefaction
     x(2) = fpul*t
     u(2) = ul
     x(12+1) = fpur*t
     u(12+1) = ur
     x(13+1) = 1
     u(13+1) = ur
     dx = (x(12+1) - x(2))/9.0
     for i=1:10
       x(2+i) = (i-1.0)*dx + x(2)
       s = x(2+i)/t
       u(2+i) = u(2+i-1) 
       u(2+i) = fzero(@rareWaveBuckLevSimp,u(2+i),[],a,s)
     end
end
    
