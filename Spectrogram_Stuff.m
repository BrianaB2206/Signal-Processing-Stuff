clc;

%subpunctul a

[x, Fs] = audioread('sp04.wav');
n = 0 : length(x) - 1;
time = n / Fs;
figure(1), plot(time, x), grid, title('Signal in absolute time'), xlabel('Time(s)');

figure(2), spectrogram(x, 512, 256, 512, Fs, 'yaxis'), colormap(jet)

X = fftshift(abs(fft(x, 512)));
omega = -pi : 2*pi / 512 : pi - 2*pi / 512;
figure(3), plot( omega, X)

%from the spectrogam, we approximate F1 = 755 Hz F2 = 555 Hz

f1 = 755 / Fs; %normalised frequency of first sinusoid
f2 = 555 / Fs; %normalised frequency of second sinusoid
w1 = 2*pi*f1; %angular frequency of first sinusoid
w2 = 2*pi*f2; %angular frequency of second sinusoid

%subpunctul b

z1 = exp(j * w1);
z2 = exp(j * w2);
z = [z1; conj(z1); z2; conj(z2)];
%coefficients of transfer function
b = poly(z);
a = 1;

figure(4), zplane(b, a); %zero-poles diagram
figure(5), freqz(b, a); %frequency response

figure(6), impz(b, a);

[H, w] = freqz(b, a);

figure(7), plot(w, abs(H)), grid;

y = filter(b, a, x);

figure(8), spectrogram(y, 512, 256, 512, Fs, 'yaxis'), colormap(jet)
figure(9), plot(time, y)
player = audioplayer(y, Fs);
play(player)

%subpunctul c
z; %zeroes
p = 0.95 * z; %poles
%coefficients
b = poly(z);
a = poly(p);

figure(10), zplane(b, a);
figure(11), freqz(b, a);

[H,w] = freqz(b, a);
figure(12), plot(w,abs(H));

figure(13), impz(b, a);

y = filter(b, a, x);

figure(14), spectrogram(y, 512, 256, 512, Fs, 'yaxis'), colormap(jet)
figure(15), plot(time, y)
player = audioplayer(y, Fs);
play(player)
