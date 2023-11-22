

xn = zeros(1,19); 
j=1;
  for i = -9:9 
    if (i<0)
        xn(j)=-log(-i+1);
    end
    if (i>=0)
        xn(j)=log(i+1);
    end
    j=j+1;
  end

puteri=linspace(-9,9,19); 
Omega = [-0.1:0.01:1.1]*2*pi; 
TFTD= sum(xn*exp(-1i*puteri'*Omega),1);


figure(1)
subplot(211);
plot(Omega,abs(TFTD)); grid;
axis([-0.2*pi,2.2*pi,-1,27]);
xlabel('\Omega (rad)');
ylabel('Amplitudine')

subplot(212)
plot(Omega,angle(TFTD)); grid;
axis([-0.2*pi,2.2*pi,-1.1*pi,1.1*pi]);
xlabel('\Omega (rad)');
ylabel('Faza (rad)');
