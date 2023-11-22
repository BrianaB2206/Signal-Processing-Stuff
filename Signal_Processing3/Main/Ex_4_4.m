
syms X s x ; 
X = (5*s-1)/(s^3-3*s-2); 
x = ilaplace(X); 
fprintf('\n x(t)= %s \n', x)


numaratorul = [5 -1]; 
numitorul = [1 0 -3 -2]; 
[r,p] = residue(numaratorul,numitorul); 
