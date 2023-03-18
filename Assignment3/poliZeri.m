%% posizionare opportunamente poli e zeri
% i poli devono essere posizionati in prossimità del cerchio unitario
% nelle pulsazioni complesse corrispondenti alle componenti armoniche
% del segnale che devono essere enfatizzate.

% gli zeri devono essere posizionati vicino ai punti del cerchio di raggio
% unitario corrispondenti alle componenti armoniche del segnale che devono 
% essere attenuate

%% progetto di filtri con poli e zeri
% poli e zeri devono essere posizionati in coppie di complessi-coniugati
% per ottenere filtri fisicamente realizzabili

%% filtro passa-basso 1 polo 1 zero
% in questo caso mettiamo uno zero fisso nell'origine (non avrà quindi
% effetto sulla risposta in frequenza) e faremo variare il polo
% dall'origine fino alla circonferenza unitaria, lungo l'asse x, sul
% semicerchio destro.

testPattern

for alpha=0.1:0.2:0.9
    k = 1-alpha; % gain
    p = alpha; % polo (se fosse stato complesso: 0+1i)
    z = 0; % zero
    [b, a] = zp2tf(z,p,k); % z point to transfert function
    xf=filter(b,a,x); % x segnale di testPattern
    figure(1), clf, plot(xf), waitforbuttonpress
    fvtool(b,a,'polezero') % disegna il cerchio con poli e zeri
end

%% esercizio 1
% costruire un filtro passa-basso con poli e zeri con cui la frequenza più
% bassa viene lasciata inalterata e la frequenza più alta deve essere
% attenuata al 40% [-0.4 0.4]

testPattern

alpha = 0.6;
k = 1-alpha;
p = alpha;
z = 0;
[b, a] = zp2tf(z,p,k);
xf = filter(b,a,x);
figure, clf, plot(xf)
fvtool(b,a,'polezero')

%% filtro passa-basso 1 polo 1 zero
% zero z = -1 molta attenuazione alle alte frequenze
% polo sempre su semiasse reale positivo (dx da 0 a 0.9)
% gain : 1-alpha/2

clear all
clc
close all

testPattern

for alpha=0.1:0.2:0.9
    k = (1-alpha)/2; % gain
    p = alpha; % polo (se fosse stato complesso: 0+1i)
    z = -1; % zero
    [b, a] = zp2tf(z,p,k); % z point to transfert function
    xf=filter(b,a,x); % x segnale di testPattern
    figure(1), clf, plot(xf), waitforbuttonpress
    fvtool(b,a,'polezero') % disegna il cerchio con poli e zeri
end

% come possiamo notare, all'ultimo caso le frq alte sono molto attenuate e
% infatti sono [-0.05 0.05], le frequenze basse sono poco attenuate [-0.8 0.8]

%% esercizio 2
% costruire un filtro passa-basso con poli e zeri con cui la frequenza più
% bassa viene lasciata inalterata e la frequenza più alta deve essere
% attenuata al 20% [-0.2 0.2]

testPattern

alpha = 0.7;
k = (1-alpha)/2;
p = alpha;
z = -1;
[b, a] = zp2tf(z,p,k);
xf = filter(b,a,x);
figure, clf, plot(xf)
fvtool(b,a,'polezero')

%% filtro passa-basso con tre zeri (e tre poli)

clear all
clc
close all

testPattern

for alpha=0.1:0.2:0.9
    k = (1-alpha)/4; % gain
    p = [alpha 0 0].'; % poli
    z = [-1 0+1i 0-1i].'; % zeri
    [b, a] = zp2tf(z,p,k); % z point to transfert function

    xf=filter(b,a,x); % x segnale di testPattern
    figure(1), clf, plot(xf), title(num2str(alpha)), waitforbuttonpress

    fvtool(b,a,'polezero') % disegna il cerchio con poli e zeri
end

%% esercizio 3 (3 poli 3 zeri)
% costruire un filtro passa-basso con poli e zeri con cui la frequenza più
% bassa viene lasciata inalterata e la frequenza più alta deve essere
% attenuata al 10% [-0.1 0.1]

testPattern

alpha = 0.55;
k = (1-alpha)/4;
p = [alpha 0 0].'; 
z = [-1 0+1i 0-1i].';
[b, a] = zp2tf(z,p,k);
xf = filter(b,a,x);
figure, clf, plot(xf)
fvtool(b,a,'polezero')