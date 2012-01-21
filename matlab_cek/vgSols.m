ul=0.5
ur=1.0
figure(3)
plot([ul,ul,ur,ur],[-1.0 0.0 0.0 1.0])
hold on
xlabel('S')
ylabel('Z')
axis([ul , ur + (ur - ul)/10.0, -1.0, 1.0])
ttl = sprintf('VGM n=%1.2f Solution at t=%3.4f',n,0.0)
title(ttl);
file= sprintf('u%03i.jpg',i)
print('-djpeg',file)
for i=0:20
    t = i*10.0
    hold off
    [xi u]=osherSol(ul,ur,-1.0/t,1.0/t)
    figure(3)
    plot(u,xi*t)
    hold on
    xlabel('S')
    ylabel('Z')
    axis([ul , ur + (ur - ul)/10.0, -1.0, 1.0])
    ttl = sprintf('VGM n=%1.2f Solution at t=%3.4f',n,t)
    title(ttl);
    file= sprintf('u%03i.jpg',i)
    print('-djpeg',file)
end
