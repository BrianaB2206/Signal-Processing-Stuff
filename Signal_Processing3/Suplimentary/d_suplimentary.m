clf;

Xn1 = zeros(1,101); 
j=1;
  for i = 0:100 
    Xn1(j)=0.8.^i;
    j=j+1;
  end
figure(1)
stem(Xn1)
grid on

puteriI=linspace(0,100,101); 
Omega = [-0.1:0.01:1.1]*2*pi;
TFTD1= sum(Xn1*exp(-1i*puteriI'*Omega),1); 

figure(2)
subplot(211);
plot(Omega,abs(TFTD1));
grid;
axis([-0.2*pi,2.2*pi,-1,6]);
xlabel('\Omega (rad)');
ylabel('Amplitudine')
subplot(212)
plot(Omega,angle(TFTD1));
grid;
axis([-0.2*pi,2.2*pi,-1.1*pi,1.1*pi]);
xlabel('\Omega (rad)');
ylabel('Faza (rad)');



Xn2 = zeros(1,41);
j=1;
  for i = 0:40 
    Xn2(j)=i*0.5.^i;
    j=j+1;
  end
figure(3)
stem(Xn2)
grid on

puteriII=linspace(0,40,41); 
Omega = [-0.1:0.01:1.1]*2*pi; 
TFTD2= sum(Xn2*exp(-1i*puteriII'*Omega),1); 

figure(4)
subplot(211);
plot(Omega,abs(TFTD2)); 
grid;
axis([-0.2*pi,2.2*pi,-1,4]);
xlabel('\Omega (rad)');
ylabel('Amplitudine')
subplot(212)
plot(Omega,angle(TFTD2));
grid;
axis([-0.2*pi,2.2*pi,-1.1*pi,1.1*pi]);
xlabel('\Omega (rad)');
ylabel('Faza (rad)');
