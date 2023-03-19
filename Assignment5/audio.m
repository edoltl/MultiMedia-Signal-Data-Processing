%% AUDIO
[y, fs] = audioread("sample1.wav");
whos y fs
% fs 48KHz
% y 640000x2 (x2 --> STEREO (L/R)) 1024000 bytes
% quanto dura la traccia audio? 64k / 48k 

t = size(y,1)/fs; % 1 per prendere la prima dimensione
% 13.3333

disp("Durata della traccia: "+num2str(t)+"s")

% DIVERSI FORMATI
info = audioinfo("sample1.wav");
% info è di tipo struct
% quindi su command: info.Filename mi ritorna il suo valore (directory e
% nome del file)

% calcolare il peso in MB del file:

fc = fs;
D = info.Duration; % congruente a t di prima (durata)
b = info.BitsPerSample; % numero bit per campione
Nc = size(y,2); % numero di canali

% * 8 bit --> byte, 1024^2 per i MB
weight = (fc * D * b * Nc) / (8 * 1024^2);

% salviamo il file in formato flac (non comune)

new_audio = "test1.flac";
audiowrite(new_audio, y, fs, 'BitsPerSample', info.BitsPerSample)

[y1, fs1] = audioread(new_audio);
info1 = audioinfo(new_audio);
% non vediamo alcuna differenza se non per il metodo di Compressione
weight1 = audio_weight_computation(info1, "flac")
% esce 3.66 (decompresso) ma in properties c'è scritto 1.66 (compresso)
% (xké il metodo di compressione è loss-less) 
isequal(y,y1)

%% RAPPRESENTAZIONE E SOTTOCAMPIONAMENTO

close all
clear, clc

[y, fs] = audioread("sample3.wav");
t = (0:size(y,1)-1)/fs;

figure
plot(t, y(:,1))
grid on
xlabel("Tempo (s)"), ylabel("Ampiezza")

% i valori sono scalati tra -1 e 1 perché stiamo leggendo l'audio come una
% matrice di double
% c'è un pattern periodico? Ascoltiamo il primo canale. (dal plot sembra di
% sì)
%sound(y(:,1),fs)

% DOWNSAMPLING (usiamo i primi 5s)
y1 = y(1:5*fs,1);
figure
t = (0:length(y1)-1)/fs;
plot(t, y1(:,1)), grid on
xlabel("Tempo (s)"), ylabel("Ampiezza")
%sound(y1,fs)

% salviamo i valori di y con passo 40
factor  = 40; % deve essere comunque <= 1000 (40 <= 1000 <= fs)
dy = y1(1:factor:end, :);
figure
t = (0:length(dy)-1)/(fs/factor);
plot(t, dy(:,1)), grid on
xlabel("Tempo (s)"), ylabel("Ampiezza")
sound(dy, fs/factor)

% trovare il minimo e il massimo dell'ampiezza del primo canale, sia del
% segnale originale (y1) sia di quello downsampled. Rappresentare y1 e dy 
% nello stesso grafico dando nomi corretti

y1_min = min(y1)
dy_min = min(dy)
y1_max = max(y1)
dy_max = max(dy)

L = factor * factor;
vettx = 1:factor:L;

figure
plot(1:L, y1(1:L))
hold on
plot(vettx, dy(1:length(vettx)), "o")
ylabel("Ampiezza"), xlabel("Campioni")

%% VELOCIZZIAMO UN FILE AUDIO

close all
clear, clc

[y, fs] = audioread("sample2.wav");
% sound(y, fs)

figure
t = (0:size(y,1)-1)/fs;
plot(t, y(:,1))
xlabel("Tempo (s)")
ylabel("Ampiezza")
title("Segnale originale")
axis tight
grid on

% 1.5x
factor = 1.5;
out = stretchAudio(y,factor);
sound(out,fs)

figure
t = (0:size(out,1)-1)/fs;
plot(t, out(:,1))
xlabel("Tempo (s)")
ylabel("Ampiezza")
title("Segnale velocizzato")
axis tight
grid on