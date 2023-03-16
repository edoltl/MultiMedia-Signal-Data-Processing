%% filtraggio traccia audio reale
[x, fs]=audioread("andiamocut.wav");
figure(1),plot(x)
%sound(x,fs) %faccio partire il suono

F = fft(x);
assex = linspace(-1/2, 1/2, numel(x))*fs;
figure(2), plot(assex, fftshift(abs(F))/numel(x))
figure(3), plot(assex, 20*log10(fftshift(abs(F))/numel(x))) % rappresentazione in db

PB = zeros(size(x));
PB(115313:124689)=1;
figure(4), plot(assex,PB), ylim([-0.05 1.05])

Ff = fftshift(F).*PB;
xb = ifft(ifftshift(Ff));
xb = real(xb);
figure(5), plot(xb), ylim([-1 1])
%sound([x; xb],fs);

PA = 1-PB;
Ff = fftshift(F).*PA;
xa = ifft(ifftshift(Ff));
xa = real(xa);
figure(6), plot(xa), ylim([-1 1])
%sound([x; xa],fs);

xf = (xa/2) + (xb*2); %suono ricostruito ma con + bassi che alti
%sound([x; xf],fs);

