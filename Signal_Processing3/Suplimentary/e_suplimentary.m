clf;

syms X t X1 X2;
X1 = exp(-2*t);
x1 = laplace(X1); 

fprintf('\n L(e^(-2t))= %s \n\n', x1)

X2 = 2*heaviside(t-1)-1; 

fplot(2*heaviside(X-1)-1,[0,2]);
x2 = laplace(X2);
fprintf('\n L(2*heaviside(t)-1)= %s \n\n', x2)
