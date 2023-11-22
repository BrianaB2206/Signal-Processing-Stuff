
clf;

N = 32 ; 
Ts = 2/N ; 
fs = 1/Ts ; 
df = fs/N ; 
n = [0:N-1]' ; 
t = Ts*n ; 
x1 = 6*exp(-4*abs(t));

 X11 = Ts*fft(x1); 
 k11 = [0:N/2-1]' ; 
 X21 = fftshift(Ts*fft(x1)) ; 
 k21 = [-N/2:N/2-1]';


figure(1)
subplot(3,1,1) ;
p = plot(t,x1,"k") ; p(1).LineWidth=2; grid on ; 
xlabel("Timpul, t (s)") ; ylabel("x1(t)") ;

subplot(3,1,2) ;
p = plot(k11*df,abs(X11(1:N/2)),"k") ; p(1).LineWidth=2 ; grid on;
xlabel("Freceventa, f (Hz)") ; ylabel("|X11(f)|") ;

subplot(3,1,3) ;
p = plot(k11*df,angle(X11(1:N/2)),"k") ; p(1).LineWidth=2 ; grid on ;
xlabel( "Frecventa, f (Hz)") ; ylabel("Faza X11(f)") ;

figure(2)
subplot(3,1,1) ;
p = plot(t,x1,"k") ; p(1).LineWidth=2; grid on ; 
xlabel("Timpul, t (s)") ; ylabel("x1(t)") ;

subplot(3,1,2) ;
 p = plot(k21*df,abs(X21(1:N)),"k") ; p(1).LineWidth=2; grid on; 
xlabel("Freceventa, f (Hz)") ; ylabel("|X21(f)|") ;

subplot(3,1,3) ;
p = plot(k21*df,angle(X21(1:N)),"k") ; p(1).LineWidth=2; grid on ; 
xlabel( "Frecventa, f (Hz)") ; ylabel("Faza X21(f)") ;



x2 = func1(t); 

 X12 = Ts*fft(x2) ; 
 k12 = [0:N/2-1]' ; 
 X22 = fftshift(Ts*fft(x2)) ; 
 k22 = [-N/2:N/2-1]'; 


figure(3)
subplot(3,1,1) ;
p = plot(t,x2,"k") ; p(1).LineWidth=2; grid on ; 
xlabel("Timpul, t (s)") ; ylabel("x2(t)") ;

subplot(3,1,2) ;
p = plot(k12*df,abs(X12(1:N/2)),"k") ; p(1).LineWidth=2 ; grid on;
xlabel("Freceventa, f (Hz)") ; ylabel("|X12(f)|") ;

subplot(3,1,3) ;
p = plot(k12*df,angle(X12(1:N/2)),"k") ; p(1).LineWidth=2 ; grid on ;
xlabel( "Frecventa, f (Hz)") ; ylabel("Faza X12(f)") ;

figure(4)
subplot(3,1,1) ;
p = plot(t,x2,"k") ; p(1).LineWidth=2; grid on ; 
xlabel("Timpul, t (s)") ; ylabel("x2(t)") ;

subplot(3,1,2) ;
 p = plot(k22*df,abs(X22(1:N)),"k") ; p(1).LineWidth=2; grid on; 
xlabel("Freceventa, f (Hz)") ; ylabel("|X22(f)|") ;

subplot(3,1,3) ;
p = plot(k22*df,angle(X22(1:N)),"k") ; p(1).LineWidth=2; grid on ; 
xlabel( "Frecventa, f (Hz)") ; ylabel("Faza X22(f)") ;
