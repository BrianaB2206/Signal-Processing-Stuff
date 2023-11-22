%Exercise6 
%a
N1=25; N2=45; N3=65; %we have 3 HPF FIR filters
Fc=5000; Fs=16000;
wn=(2*Fc)/Fs; % same notation for f
%due to the fact we have to use window method, we have to use fir1
%due to the fact we have to use rectangular window, we have to use boxcar

h1_box=fir1(N1-1, wn, 'high', boxcar(N1)); 
h2_box=fir1(N2-1, wn, 'high', boxcar(N2));
h3_box=fir1(N3-1, wn, 'high', boxcar(N3));

n1=0:1:N1-1;
n2=0:1:N2-1;
n3=0:1:N3-1;
%impulse response
figure(1),subplot(3,1,1),stem(n1,h1_box),grid,xlabel('n1'),ylabel('magnitude') 
          subplot(3,1,2),stem(n2,h2_box),grid,xlabel('n2'),ylabel('magnitude') 
          subplot(3,1,3),stem(n3,h3_box),grid,xlabel('n3'),ylabel('magnitude')
%zero position
figure(2),subplot(3,1,1),zplane(h1_box),grid, title('Zeroes position')
          subplot(3,1,2),zplane(h2_box),grid, title('Zeroes position')
          subplot(3,1,3),zplane(h3_box),grid, title('Zeroes position')
          
%angular frequency characteristics 
H1_box=fft(h1_box,512); %the Fourier transform of h1
H2_box=fft(h2_box,512); %the Fourier transform of h2
H3_box=fft(h3_box,512); %the Fourier transform of h3
w=-pi: 2*pi/512: pi-2*pi/512;

Hf1_box=fftshift(abs(H1_box));
Hf2_box=fftshift(abs(H2_box));
Hf3_box=fftshift(abs(H3_box));

%linear
figure(3),plot(w,Hf1_box,'b',w,Hf2_box,'r',w,Hf3_box,'g'),grid
xlabel('Normalized frequency'),ylabel('Linear Amplitude')
legend('N1=25','N2=45','N3=65')
% dB
figure(4),plot(w,20*log10(Hf1_box),'b',w,20*log10(Hf2_box),'r',w,20*log10(Hf3_box),'g'),grid
xlabel('Normalized frequency'),ylabel('Amplitude in dB')
legend('N1=25','N2=45','N3=65')

%same but for hamming 
h1_ham=fir1(N1-1, wn, 'high', hamming(N1)); 
h2_ham=fir1(N2-1, wn, 'high', hamming(N2));
h3_ham=fir1(N3-1, wn, 'high', hamming(N3));

H1_ham=fft(h1_ham,512); %the Fourier transform of h1
H2_ham=fft(h2_ham,512); %the Fourier transform of h2
H3_ham=fft(h3_ham,512); %the Fourier transform of h3
w=-pi: 2*pi/512: pi-2*pi/512;

Hf1_ham=fftshift(abs(H1_ham));
Hf2_ham=fftshift(abs(H2_ham));
Hf3_ham=fftshift(abs(H3_ham));

%linear
figure(5),plot(w,Hf1_ham,'b',w,Hf2_ham,'r',w,Hf3_ham,'g'),grid
xlabel('Normalized frequency'),ylabel('Linear Amplitude')
legend('N1=25','N2=45','N3=65')
%box
figure(6),plot(w,20*log10(Hf1_ham),'b',w,20*log10(Hf2_ham),'r',w,20*log10(Hf3_ham),'g'),grid
xlabel('Normalized frequency'),ylabel('Linear Amplitude')
legend('N1=25','N2=45','N3=65')


%b) frequency sampling =fir2 - rectangular window
N1=25; N2=45; N3=65; 
Fc=5000; Fs=16000;
wn=(2*Fc)/Fs; % same notation for f
f=[0,wn,wn,1];
m=[0,0,1,1];
figure(7),plot(f,m),axis([0 1 -0.2 1.2]),grid,xlabel('m'),ylabel('f'),
title('The frequency response of the HighPass filter')
h1_b=fir2(N1-1, f, m, boxcar(N1)); 
h2_b=fir2(N2-1, f, m, boxcar(N2));
h3_b=fir2(N3-1, f, m, boxcar(N3));

H1_b=fft(h1_b,512); %the Fourier transform of h1
H2_b=fft(h2_b,512); %the Fourier transform of h2
H3_b=fft(h3_b,512); %the Fourier transform of h3
w=-pi: 2*pi/512: pi-2*pi/512;

figure(8),plot(w,fftshift(abs(H1_b)),w,fftshift(abs(H2_b)),w,fftshift(abs(H3_b))), 
grid, xlabel('normalized freq'), ylabel('magnitude'), title('linear Amplitude-freq characteristic using boxcar') 
legend('H1_b(N1=25)','H2_b(N2=45)','H3_b(N3=65)')

figure(9),plot(w,20*log10(fftshift(abs(H1_b))),w,20*log10(fftshift(abs(H2_b))),w,20*log10(fftshift(abs(H3_b)))), 
grid, xlabel('normalized freq'), ylabel('magnitude'), title('Amplitude-freq characteristic in dB using boxcar') 
legend('H1_b(N1=25)','H2_b(N2=45)','H3_b(N3=65)')


% hamming cu fir2
h1_b_ham=fir2(N1-1, f, m, hamming(N1));
h2_b_ham=fir2(N2-1, f, m, hamming(N2));
h3_b_ham=fir2(N3-1, f, m, hamming(N3));

H1_b_ham=fft(h1_b_ham,512);
H2_b_ham=fft(h2_b_ham,512); 
H3_b_ham=fft(h3_b_ham,512); 
w=-pi:2*pi/512:pi-2*pi/512; 

figure(10),
plot(w,fftshift(abs(H1_b_ham)),w,fftshift(abs(H2_b_ham)),w,fftshift(abs(H3_b_ham) )),
grid, xlabel('normalized freq'), ylabel('magnitude'), 
title('linear Amplitude-freq characteristic using Hamming'), 
legend('H1_b_ham(N1=25)','H2_b_ham(N2=45)','H3_b_ham(N3=65)')


figure(11),
plot(w,20*log10(fftshift(abs(H1_b_ham))),w,20*log10(fftshift(abs(H2_b_ham))),w,20*log10(fftshift(abs(H3_b_ham)))),
grid, xlabel('normalized freq'), ylabel('magnitude'), 
title('linear Amplitude-freq characteristic using Hamming'), 
legend('H1_b_ham(N1=25)','H2_b_ham(N2=45)','H3_b_ham(N3=65)')









