clf;

syms X t Xa Xb;
Xa = heaviside(t)-2*heaviside(t-1)+heaviside(t-2);
xa = laplace(Xa); 

figure(1)
fplot(heaviside(X)-2*heaviside(X-1)+heaviside(X-2),[-1,3])
grid on
fprintf('\n L(heaviside(t)-2*heaviside(t-1)+heaviside(t-2))= %s \n\n', xa)

Xb = heaviside(t)-1.5*heaviside(t-1)+heaviside(t-2)-0.5*heaviside(t-3); 
xb = laplace(Xb);

figure(2)
fplot(heaviside(X)-1.5*heaviside(X-1)+heaviside(X-2)-0.5*heaviside(X-3),[-1,4])
grid on
fprintf('\n L(heaviside(t)-1.5*heaviside(t-1)+heaviside(t-2)-0.5*heaviside(t-3))= %s \n\n', xb)
