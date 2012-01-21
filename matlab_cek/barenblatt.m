pa=[0.5 1.5 2.5]
for i=1:3
p=pa(i)
b=1.0
t = 1.0
z=5.0
if p>1
 z = sqrt(2*p*(p+1)/(p-1)*b)*t^(1/(p+1))
end

x(i,:)=[0:z/100.0:z]
u(i,:) = t^(-1/(p+1)).*(b - (p-1)*(x(i,:)/(t.^(1/(p+1)))).^2 / (2*p*(p+1))).^(1/(p-1))
end
plot(x',u')
xlabel('x')
ylabel('u')
legend('p=1/2','p=3/2','p=5/2')