
clf;

syms X1 X2 x1 x2 s; 
X1 = 1/(s+1)-exp(-s)/(s+1); 
x1 = ilaplace(X1); 
fprintf('\n x1(t)= %s \n', x1)

X2 = (s+1)/(s^2+5*s+6); 
x2 = ilaplace(X2); 
fprintf('\n x2(t)= %s \n', x2)
