[x, fs]=audioread("audio2.wav");
figure(1), plot(x)
sound(x,fs);

fmin = 650;
fmax = 1670;

a = 1; 
b = 1032;
% a e b range del primo campione
% aumenterò simultanemanente a e b per cambiare campione
c = 2;
% c per stamparepiù figure

% a=1:1574:14167
% b=1108:1591:15427
while a <= 14167 && b <= 15427
        y = x(a:b); % prendo il campione sull'intervallo [a b]
        a = a + 1574;
        b = b + 1591;
        % a e b passano al secondo intervallo per il secondo campione
        F = fftshift(fft(y)); % FT su y
        freqNorm = linspace(-1/2, 1/2, numel(F)).*fs;
        figure(c), plot(freqNorm, abs(F)/numel(F)),
        xlabel("frequenze"), ylabel("altezze"), xlim([fmin fmax]);
        c = c + 1;
end

fprintf('CIAO\n');

%LA PAROLA RAPPRESENTATA E' CIAO
% figure 2 702 1338 2
% figure 3 694 1335 2
% figure 4 702 1340 2 C
% figure 5 768 1212 4 
% figure 6 775 1212 4
% figure 7 774 1211 4 I
% figure 8 702 1338 2 A
% figure 9 772 1481 6 
% figure 10 771 1484 6 
% figure 11 770 1479 6 O