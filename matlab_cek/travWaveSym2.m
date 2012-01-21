syms u p q 
q=2
syms yp1q2 yp2q2 yp3q2 yp4q2 
p=1
yp1q2 = int((p*u^(p-1))/(u^q - u))
p=2
yp2q2 = int((p*u^(p-1))/(u^q - u))
p=3
yp3q2 = int((p*u^(p-1))/(u^q - u))
p=4
yp4q2 = int((p*u^(p-1))/(u^q - u))
syms yp1q1b2 yp2q1b2 yp3q1b2 yp4q1b2 
q=1/2
p=1
yp1q1b2 = int((p*u^(p-1))/(u^q - u))
p=2
yp2q1b2 = int((p*u^(p-1))/(u^q - u))
p=3
yp3q1b2 = int((p*u^(p-1))/(u^q - u))
p=4
yp4q1b2 = int((p*u^(p-1))/(u^q - u))
