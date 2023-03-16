close all
clc

%% costruire il test pattern
testPattern
figure(1), plot(x)

%% trasformata
F = fft(x)
assex = linspace(-1/2, 1/2, numel(x))*FS;
figure(2), plot(assex, fftshift(abs(F)) / numel(x));

% abbiamo quindi nella trasformata 5 picchi a destra e 5 picchi a sx
% i picchi sono in 5 10 20 40 80 (e -5 -10 ...) di ampiezza 1

%% vogliamo costruire un filtro passabasso ideale
% che faccia passare solo le due freq piu basse

figure(3), plot(fftshift(abs(F)) / numel(x));
% prendiamo una finestra sulle frq piu basse quindi da 975 a 1075

PB = zeros(size(x)); % prima faccio tutti zero
PB(925:1075) = 1; % poi 1 nella zona che voglio

figure(4), plot(assex,PB), ylim([-0.05 1.05]);

F = fft(x);
Ff = fftshift(F).*PB;
figure(5), plot(assex,abs(Ff)/numel(x));
xf = ifft(ifftshift(Ff)); %trasformata inversa per ottenere il segnale filtrato
xf = real(xf);
figure(6), plot(xf); %quindi ora vedo le sinusoidi "sopravvissute" al filtro

%% filtro passa alto ideale (passano le 3 freq più alte)
% trucco: 1-PB
% altrimenti dovrei prendere due intervalli, quelli a dx di PB
% e quelli a sx di PB

PA = 1-PB;
PA = PA*0.5; % se voglio dimezzare l'ampiezza del segnale
% PA = PA * 2 se voglio aumentarla (esempi)
figure(7), plot(assex,PA), ylim([-0.05 1.05]);
F = fft(x);
Ff = fftshift(F).*PA;
figure(8), plot(assex,abs(Ff)/numel(x));
xf = ifft(ifftshift(Ff)); %trasformata inversa per ottenere il segnale filtrato
xf = real(xf);
figure(9), plot(xf);

%% filtro passa-banda ideale (passare solo la 3 freq)

passabanda = zeros(size(x));
passabanda ([852:928 1075:1149]) = 1;
figure(10), plot(assex,passabanda), ylim([-0.05 1.05]);
F = fft(x);
Ff = fftshift(F).*passabanda;
figure(11), plot(assex,abs(Ff)/numel(x))
xf = ifft(ifftshift(Ff));
xf = real(xf);
figure(12), plot(xf);

%% filtro blocca-banda ideale (blocca solo la 3 freq)
% detto anche notch

passabanda = zeros(size(x));
passabanda ([852:928 1075:1149]) = 1;
bloccabanda = 1-passabanda;
figure(13), plot(assex,bloccabanda), ylim([-0.05 1.05]);
F = fft(x);
Ff = fftshift(F).*bloccabanda;
figure(14), plot(assex,abs(Ff)/numel(x))
xf = ifft(ifftshift(Ff));
xf = real(xf);
figure(15), plot(xf);