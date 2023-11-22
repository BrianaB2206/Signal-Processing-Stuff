function [f] = numep (t,T,nume)

for i=1:length(nume)
  a(i)=double(nume(i))-64;
endfor;
for i=1:length(t)
  temp=mod(t(i),T);
  L=length(a);
  nr=floor(temp/(T/L))+1;
  f(i)=a(nr);
endfor

endfunction
