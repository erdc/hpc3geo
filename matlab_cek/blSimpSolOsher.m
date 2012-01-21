ul=0.0
ur=1.0
figure(3)
plot([ul,ul,ur,ur],[-1.0 0.0 0.0 1.0])
hold on
xlabel('S')
ylabel('Z')
%axis([-1.0, 1.0,ur , ul + (ul - ur)/10.0])
axis([ul , ur + (ur - ul)/10.0,-1.0, 1.0])
ttl = sprintf('Solution at t=%3.4f',0.0)
title(ttl);
file= sprintf('u%03i.jpg',i)
print('-djpeg',file)
for i=0:20
    t = i*0.008
    hold off
    [xi u]=osherSolBLSimpG(ul,ur,-1.0/t,1.0/t)
    figure(3)
    plot(u,xi*t)
    hold on
    xlabel('S')
    ylabel('Z')
    %axis([-1.0, 1.0,ur , ul + (ul - ur)/10.0])
    axis([ul , ur + (ur - ul)/10.0,-1.0, 1.0])
    ttl = sprintf('Solution at t=%3.4f',t)
    title(ttl);
    file= sprintf('u%03i.jpg',i)
    print('-djpeg',file)
end
