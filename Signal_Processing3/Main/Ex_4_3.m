
syms x 	w t;
x = cos(w*t);
X = laplace(x); 
fprintf('\n L(cos(w*t))= %s \n\n', X)