%% Band-Stop Cebasev-2, ord = 4, 2600-3600, 12000, max riples 30, bilinear
%% Ex 1

n = 4;
Fc1 = 2600;
Fc2 = 3600;
Fs = 12000;
Rs = 30;

[b, a] = cheby2(n, Rs, [Fc1, Fc2], 'stop', 's');
figure(1)
freqs(b, a);
saveas(gcf, 'E:\Tema_pds_3\1', 'png')
fvtool(b,a,'polezero')
saveas(gcf, 'E:\Tema_pds_3\2.png', 'png')

[bd, ad] = bilinear(b, a, Fs);
figure(3)
freqz(bd, ad);
saveas(gcf, 'E:\Tema_pds_3\3.png', 'png')
figure(4)
zplane(bd, ad);
saveas(gcf, 'E:\Tema_pds_3\4.png', 'png')


[Ha, Wa] = freqs(b, a);
[Hd, Wd] = freqz(bd, ad);

figure(5)
plot(Wd,20*log10(fftshift(abs(Hd)))), grid
saveas(gcf, 'E:\Tema_pds_3\5.png', 'png')

wc1 = 2*pi*Fc1/Fs
wC2 = 2*pi*Fc2/Fs

%% Ex 2

Wp = [(2*Fc1 -50)/Fs, (2*Fc2 + 50)/Fs];
Ws = [2*Fc1/Fs, 2*Fc2/Fs]; 

Rp = 1;
Rs = 30;

[n, Wn] = cheb2ord(Ws, Wp, Rp, Rs);
[bd, ad] = cheby2(n, Rs, Wn);
figure(6)
freqz(bd, ad);
saveas(gcf, 'E:\Tema_pds_3\6.png', 'png')
figure(7)
zplane(bd, ad);
saveas(gcf, 'E:\Tema_pds_3\7.png', 'png')
figure(8)
plot(Wd,20*log10(fftshift(abs(Hd)))), grid
saveas(gcf, 'E:\Tema_pds_3\8.png', 'png')
%Ex 3

t = 0: 1/Fs : 1;
x = chirp(t, 0, 1, Fs/2);
y=filter(bd,ad,x);

figure(9)
plot(t, x)
saveas(gcf, 'E:\Tema_pds_3\9.png', 'png')
figure(10)
plot(t, y)
saveas(gcf, 'E:\Tema_pds_3\10.png', 'png')

figure(11),spectrogram(x,512,256,512,Fs,'yaxis'),colormap(jet)
saveas(gcf, 'E:\Tema_pds_3\11.png', 'png')
figure(12),spectrogram(y,512,256,512,Fs,'yaxis'),colormap(jet)
saveas(gcf, 'E:\Tema_pds_3\12.png', 'png')