

clear all ; clf

N = 32 ; 
Ts = 2/N ; 
fs = 1/Ts ; 
df = fs/N ; 
n = [0:N-1]' ; 
t = Ts*n ; 
x = func(t); 

 X1 = Ts*fft(x) ;
 X2 = fftshift(Ts*fft(x)) ; 
 k1 = [0:N/2-1]' ; 
 k2 = [-N/2:N/2-1]';


figure(1)
subplot(3,1,1) ;
p = plot(t,x,"k") ; p(1).LineWidth=2; grid on ; 
xlabel("Timpul, t (s)") ; ylabel("x(t)") ;

subplot(3,1,2) ;
p = plot(k1*df,abs(X1(1:N/2)),"k") ; p(1).LineWidth=2 ; grid on;
xlabel("Freceventa, f (Hz)") ; ylabel("|X(f)|") ;

subplot(3,1,3) ;
p = plot(k1*df,angle(X1(1:N/2)),"k") ; p(1).LineWidth=2 ; grid on ;
xlabel( "Frecventa, f (Hz)") ; ylabel("Faza X(f)") ;

figure(2)
subplot(3,1,1) ;
p = plot(t,x,"k") ; p(1).LineWidth=2; grid on ; 
xlabel("Timpul, t (s)") ; ylabel("x(t)") ;

subplot(3,1,2) ;
 p = plot(k2*df,abs(X2(1:N)),"k") ; p(1).LineWidth=2; grid on; 
xlabel("Freceventa, f (Hz)") ; ylabel("|X(f)|") ;

subplot(3,1,3) ;
p = plot(k2*df,angle(X2(1:N)),"k") ; p(1).LineWidth=2; grid on ; 
xlabel( "Frecventa, f (Hz)") ; ylabel("Faza X(f)") ;
