clear all; clf

f0=50;
T=1/f0;
step=T/100;
omega0=1*pi*f0;
t=-T:step:2*T;

w=func(t,T);

figure(1);
subplot(3,1,1);
plot(t,w);
xlabel('Time');
ylabel('Amplitude');
title('Signal for function w');

%TRIGON
q=@(t)func(t,T);
cc=1/T*quad(q,0,T);
N=100;
a=zeros(1,N);
b=zeros(1,N);
ft=cc;
for k=1:N
  b1=@(t)func(t,T)*cos(k*omega0*t);
  b2=@(t)func(t,T)*sin(k*omega0*t);
  a(k)=2/T*quad(b1,0,T);
  b(k)=2/T*quad(b2,0,T);
  ft=ft+a(k)*cos(k*omega0*t)+b(k)*sin(k*omega0*t);
end


  if abs(a(k))<10^-10
    a(k)=0;
  endif
  if abs(b(k))<10^-10
    b(k)=0;
  endif
  
  subplot(3,1,2);
  plot(t,w);
  xlabel('Time');
  ylabel('Amplitude');
  title('Signal for TRIGONOMETRIC');
  
  sRec=cc*ones(1,length(t));
  figure(1)
  hold on 
  plot(t,sRec) 
  hold off
  
for i = 1:length(a)
    sRec = sRec + a(i)*cos(i*omega0*t)+b(i)*sin(i*omega0*t); 
    figure(1)
    hold on 
    plot(t,sRec) 
    hold off 
    pause(0.01)
end
  
subplot(3,1,3);
plot(t,w);
title('Step by step comparison between the original and the reconstructed signal')
hold on
plot(t,sRec,'r') 
legend('original', 'reconstructed') 
hold off

%HARMON
N=100;
a=zeros(1,N);
b=zeros(1,N);
A=zeros(1,N+1);
cc=1/T*quad(@(t)func(t,T),0,T);

if cc<10^-10
  cc=0;
endif

A(1)=abs(cc);

if cc >=0
  phi(1)=0;
else
  phi(1)=-pi;
endif

for k=1:N
  a(k) = 2/T * quad(@(t)(func(t,T).*cos(k*omega0*t)),0,T);
  b(k) = 2/T * quad(@(t)(func(t,T).*sin(k*omega0*t)),0,T); 
  
  if abs(a(k))<10^-10
  a(k) = 0;
end

if abs(b(k))<10^-10 
  b(k) = 0;
end
 
  A(k+1) = sqrt(a(k)^2+b(k)^2); 
if a(k)==0 && b(k)==0 
    phi(k+1) = 0;
  else 
    if a(k)>=0
      phi(k+1) = -atan(b(k)/a(k)); 
      else
      phi(k+1) = -atan(b(k)/a(k))-pi;
    end
 
  end
 
end

figure(2);
subplot(2,1,1);
stem((0:N)*omega0,A); 
xlabel('Frequency'); 
ylabel('Amplitude'); 
title('Amplitude spectrum for HARMONIC');

subplot(2,1,2);
stem((0:N)*omega0,phi); 
xlabel('Frequency'); 
ylabel('Phase'); 
title('Phase spectrum for HARMONIC');

N =100;
C = zeros(1,2*N+1);
for n=-N:N
  C(n+N+1) = 1/T * quad(@(t)func(t,T).*exp(-1j*n*omega0*t),0,T);
  re = real(C(n+N+1));
  im = imag(C(n+N+1)); 
  if abs(re)<10^-10
    re =0;
  end
  if abs(im)<10^-10 
    im = 0;
  end 
  C(n+N+1)=re+1j*im;
end

figure(3);
subplot(2,1,1);
stem((-N:N)*omega0,abs(C)); 
xlabel('Frequency'); 
ylabel('Amplitude'); 
title('Amplitude spectrum for COMPLEX');

subplot(2,1,2);
stem((-N:N)*omega0,angle(C)); 
xlabel('Frequency'); 
ylabel('Phase'); 
title('Phase spectrum for COMPLEX');

cca=7;
z=0;

for n=-cca:cca
  Ccca(n+N+1)=1/T*quad(@(t)func(t,T).*exp(-1j*n*omega0*t),0,T);
  ccare=real(Ccca(n+N+1));
  ccaim=imag(Ccca(n+N+1));
  if abs(ccare)<10^-10
    ccare=0;
  end
  if abs(ccaim)<10^-10
    ccaim=0;
  end
  Ccca(n+N+1)=ccare+1j*ccaim;
  z=z+Ccca(n+N+1)*exp(-1j*n*omega0*t);
endfor

Pe=1/T*quad(@(t)abs(func(t,T)-z).^2,0,T);

figure(4);
plot(t,z);
xlabel('Time');
ylabel('Amplitude');
title('Signal generated by aproximation');
