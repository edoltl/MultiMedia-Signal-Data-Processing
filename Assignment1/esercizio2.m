[x1, ~] = sinusoide(2,1/4,0,0,23);
[x2, n] = finestra_alt(0,length(x1)-1,5,15);
x = x1.*x2;
% la finestra di ampiezza 1 seleziona l'intervallo
% del segnale principale
% quindi in x ho 0 al di fuori di [5, 15]
% e ho x1 all'interno dell'intervallo
figure(1), clf
subplot(2,1,1)
plot(n,x1,n,x)
title('dominio temporale')
F1 = fft(x1);
F1 = fftshift(F1);
F2 = fft(x);
F2 = fftshift(F2);
normFreq=linspace(-1/2,1/2,length(F1));
subplot(2,1,2)
plot(normFreq, abs(F1)/numel(F1), normFreq, abs(F2)/numel(F2))
title('moduli FT')
% nelle ampiezze dei moduli si può notare che il modulo della trasformata
% del seno ha ampiezza 2/2=1
% quello del seno selezionato ha ampiezza 1/2=0.5
% sono entrambi centrati in 1/4 = 0.25 (circa, sarebbe 0.25 con una
% risoluzione dello spettro maggiore -> con piu' campioni)