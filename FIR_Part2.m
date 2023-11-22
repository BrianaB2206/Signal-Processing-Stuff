%%a) Design with the window method (fir1 function) three band-stop FIR filters with linear phase, of 
%%lengths N1 = 35, N2 = 55, N3 = 75, the cutoff frequency Fc1=3 kHz, Fc2=5kHz the sampling frequency 
%%Fs=16 kHz using the rectangular window. Represent the impulse responses and zero position (with subplot 
%%function 3 graphs / figure). Represent with the plot function on the same graph the amplitude / normalized 
%%angular frequency characteristics of the 3 filters (overlapping the plots with different colors, mentioning 
%%the window used in the legend). Design the same filters using the Hann window.
%%b) Re-design filters using the uniform frequency sampling method (fir2 function) using the same windows. 
%%Plot the amplitude characteristics (linear and dB). Compare the two methods in terms of the level of ripples 
%%in the pass-band and attenuation in the stop-band.

N1 = 35;
N2 = 55;
N3 = 75;

Fc1 = 3000;
Fc2 = 5000;
Fs = 16000;

%%%%%%%%% fir1 method
%%%%%%%%% Rectangular Window

wn = [2*Fc1/Fs, 2*Fc2/Fs];

h1 = fir1(N1 - 1, wn,'stop', boxcar(N1));
h2 = fir1(N2 - 1, wn, 'stop', boxcar(N2));
h3 = fir1(N3 - 1, wn, 'stop', boxcar(N3));

figure(1)
subplot(3,1,1), stem([0 : N1-1], h1)
subplot(3,1,2), stem([0 : N2-1], h2)
subplot(3,1,3), stem([0 : N3-1], h3)
saveas(gcf, 'E:\Tema_pds_3\1', 'png')

figure(2)
subplot(3,1,1), zplane(h1)
subplot(3,1,2), zplane(h2)
subplot(3,1,3), zplane(h3)
saveas(gcf, 'E:\Tema_pds_3\2', 'png')

H1=fft(h1,512);
H2=fft(h2,512);
H3=fft(h3,512);
w=-pi:2*pi/512:pi-2*pi/512;
figure(3)
hold on;
plot(w,fftshift(abs(H1)))
plot(w,fftshift(abs(H2)))
plot(w,fftshift(abs(H3)))
grid;
hold off;
saveas(gcf, 'E:\Tema_pds_3\3', 'png')

%%%%%%%%% Hann Window

h1 = fir1(N1 - 1, wn,'stop', hanning(N1));
h2 = fir1(N2 - 1, wn, 'stop', hanning(N2));
h3 = fir1(N3 - 1, wn, 'stop', hanning(N3));

figure(4)
subplot(3,1,1), stem([0 : N1-1], h1)
subplot(3,1,2), stem([0 : N2-1], h2)
subplot(3,1,3), stem([0 : N3-1], h3)
saveas(gcf, 'E:\Tema_pds_3\4', 'png')

figure(5)
subplot(3,1,1), zplane(h1)
subplot(3,1,2), zplane(h2)
subplot(3,1,3), zplane(h3)
saveas(gcf, 'E:\Tema_pds_3\5', 'png')

H1=fft(h1,512);
H2=fft(h2,512);
H3=fft(h3,512);
w=-pi:2*pi/512:pi-2*pi/512;
figure(6)
hold on;
plot(w,fftshift(abs(H1)))
plot(w,fftshift(abs(H2)))
plot(w,fftshift(abs(H3)))
grid;
hold off;
saveas(gcf, 'E:\Tema_pds_3\6', 'png')
%%%%%%%%%% fir2 function

wn = [0, 2*Fc1/Fs, 2*Fc1/Fs, 2*Fc2/Fs, 2*Fc2/Fs, 1];
m = [1, 1, 0, 0, 1, 1];
h1 = fir2(N1 - 1, wn, m, boxcar(N1));
h2 = fir2(N2 - 1, wn, m, boxcar(N2));
h3 = fir2(N3 - 1, wn, m, boxcar(N3));

figure(7)
subplot(3,1,1), stem([0 : N1-1], h1)
subplot(3,1,2), stem([0 : N2-1], h2)
subplot(3,1,3), stem([0 : N3-1], h3)
saveas(gcf, 'E:\Tema_pds_3\7', 'png')
figure(8)
subplot(3,1,1), zplane(h1)
subplot(3,1,2), zplane(h2)
subplot(3,1,3), zplane(h3)
saveas(gcf, 'E:\Tema_pds_3\8', 'png')
H1=fft(h1,512);
H2=fft(h2,512);
H3=fft(h3,512);
w=-pi:2*pi/512:pi-2*pi/512;
figure(9)
hold on;
plot(w,fftshift(abs(H1)))
plot(w,fftshift(abs(H2)))
plot(w,fftshift(abs(H3)))
grid;
hold off;
saveas(gcf, 'E:\Tema_pds_3\9', 'png')
%%%%%%%%% Hanning Window

h1 = fir2(N1 - 1, wn, m, hanning(N1));
h2 = fir2(N2 - 1, wn, m, hanning(N2));
h3 = fir2(N3 - 1, wn, m, hanning(N3));

figure(10)
subplot(3,1,1), stem([0 : N1-1], h1)
subplot(3,1,2), stem([0 : N2-1], h2)
subplot(3,1,3), stem([0 : N3-1], h3)
saveas(gcf, 'E:\Tema_pds_3\10', 'png')
figure(11)
subplot(3,1,1), zplane(h1)
subplot(3,1,2), zplane(h2)
subplot(3,1,3), zplane(h3)
saveas(gcf, 'E:\Tema_pds_3\11', 'png')
H1=fft(h1,512);
H2=fft(h2,512);
H3=fft(h3,512);
w=-pi:2*pi/512:pi-2*pi/512;
figure(12)
hold on;
plot(w,fftshift(abs(H1)))
plot(w,fftshift(abs(H2)))
plot(w,fftshift(abs(H3)))
grid;
hold off;
saveas(gcf, 'E:\Tema_pds_3\12', 'png')