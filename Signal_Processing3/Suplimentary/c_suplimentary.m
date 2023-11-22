clf;

%a)

Xa = zeros(1,21); 
j=1;
  for i = -9:11 
    if (i<0)&&(i>7)
        Xa(j)=0;
    end
    if (i>-1)&&(i<5)
        Xa(j)=2;
    end
    if (i>4)&&(i<8)
        Xa(j)=-2;
    end
    j=j+1;
  end

puteriunu=linspace(-9,11,21); 
Omega = [-0.1:0.01:1.1]*2*pi;
TFTDa= sum(Xa*exp(-1i*puteriunu'*Omega),1);


figure(1)
subplot(211);
plot(Omega,abs(TFTDa));
grid;
axis([-0.2*pi,2.2*pi,-1,22]);
xlabel('\Omega (rad)');
ylabel('Amplitudine')
subplot(212)
plot(Omega,angle(TFTDa)); 
grid;
axis([-0.2*pi,2.2*pi,-1.1*pi,1.1*pi]);
xlabel('\Omega (rad)');
ylabel('Faza (rad)');

%b)

Xb = zeros(1,19); 
j=1;
  for i = -8:10 
    if (i<-2)&&(i>5)
        Xb(j)=0;
    end
    if (i>-3)&&(i<3)
        Xb(j)=2;
    end
    if (i>2)&&(i<6)
        Xb(j)=3;
    end
    j=j+1;
  end
  
puteridoi=linspace(-8,10,19); 
Omega = [-0.1:0.01:1.1]*2*pi; 
TFTDb= sum(Xb*exp(-1i*puteridoi'*Omega),1); 


figure(2)
subplot(211);
plot(Omega,abs(TFTDb)); 
grid;
axis([-0.2*pi,2.2*pi,-1,22]);
xlabel('\Omega (rad)');
ylabel('Amplitudine')
subplot(212)
plot(Omega,angle(TFTDb)); 
grid;
axis([-0.2*pi,2.2*pi,-1.1*pi,1.1*pi]);
xlabel('\Omega (rad)');
ylabel('Faza (rad)');