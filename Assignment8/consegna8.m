%% scegliete voi l'immagine di partenza!

close all
clc
im=imread('0nXivwF.bmp');
figure(1), clf, imshow(im)

%% numero di colori totali
S=size(im);
% [] tante righe, 3 colonne
im=reshape(im,[],3); % in ciascuna delle colonne c'è rispettivamente R, G, e B
nc=unique(im,'rows'); % quante sono le righe uniche delle immagine?
nc=size(nc,1); % da 9070x3 a 9070
im=reshape(im,S); % ristabilisco l'immagine originale

%% decidere il numero di colori da mantenere per indicizzazione
%%%% opzione 1: do il numero di colori
ncolori = 400; % scegliere ncolori < nc
[im_ind, map]=rgb2ind(im, ncolori);

%%%% opzione 2: do io la mappa
% map=[254 216 32;
%      220 214 211;
%      0 0 0]/255; 
% im_ind=rgb2ind(im,map);
% imc=ind2rgb8(im_ind,map);

imc = im2uint8(ind2rgb(im_ind, map));
figure(2), clf, imshow(imc) % immagine con 400 colori
figure(3), clf, imshow(imabsdiff(imc, im)) % differenza tra originale e 500 colori
% anche qui si vede poco, vediamo quindi dove gli errori si concentrano
figure(4), clf, imagesc(max(imabsdiff(imc, im), [], 3)), colorbar

% gli errori sono molto concentrati sulla barba di homer, ci sono molti
% puntini gialli (con 200 colori)
% quindi ho messo 400 colori

%% codifica RLE
% scegliete voi il modo per codificare con RLE il contenuto di im_ind

im_ind_lin = im_ind(:);

% Calcolo dei valori dei pixel e delle lunghezze delle sequenze
values = [];
lengths = [];

curr_val = im_ind_lin(1);
curr_len = 1;

for i = 2:numel(im_ind_lin)
    if im_ind_lin(i) == curr_val
        curr_len = curr_len+1;
    else
        values = [values curr_val];
        lengths = [lengths curr_len];
        curr_val = im_ind_lin(i);
        curr_len = 1;
    end
end

values = [values curr_val];
lengths = [lengths curr_len];

% Concatenazione dei vettori "values" e "lengths"
rle = [values; lengths];

S2 = size(im_ind);

%% salvataggio della codifica RLE con TUTTE le informazioni ausiliarie
% save RLE rle;
% salvo rle per poter decodificare
% save MAP map;
% map per passare da immagine indicizzata a immagine "originale"
% save SizeInd S2;
% save IM im
% im non serve all'RLE ma faccio un confronto con isequal(im,im2)
% im2 è quella ottenuta dopo la decodifica

save RLEInfos rle map im S2;

%% load della codifica RLE con TUTTE le informazioni ausiliarie
load RLEInfos

%% decodifica RLE
% a partire dal contenuto del solo file salvato al punto precedente, devo
% essere in grado di ricostruire im_ind e successivamente im (ovvero
% l'immagine originale a colori)

% separo vettori "values" e "lengths"
values = rle(1,:);
lengths = rle(2,:);

% Ricostruzione del vettore im_ind_lin
im_ind_lin = repelem(values, lengths);

% Reshape di "im_ind_lin" per ottenere l'immagine indicizzata "im_ind"
im_ind = reshape(im_ind_lin, S2);

% Conversione di "im_ind" nell'immagine a colori "im2" utilizzando la color map "map"
im2 = im2uint8(ind2rgb(im_ind, map));

isequal(im,im2) % con perdita --> 0
%% calcolare rapporto di compressione

% 1. calcolo della dimensione dell'immagine im decompressa/decodificata in
% memoria (RAM)

num_pixel = numel(im2);
pixel_size = 3; % ogni pixel richiede 3 byte per rappresentare un colore RGB
image_size = num_pixel * pixel_size;

% 2. calcolo della dimensione in memoria della vostra codifica RLE (tenendo
% conto di tutte le informazioni necessarie per ricostruire l'immagine di
% partenza)

dim_values = numel(values) * 2;
dim_lengths = numel(lengths) * 2; 
% * 2 perché sono uint16
dim_map = numel(map)*8; % numel map = 500*3

dim_mem = dim_values + dim_lengths + dim_map;

% 3. calcolo del rapporto tra dimensioni al punto 2 e dimensioni al punto 1
% (sperando che sia il più piccolo possibile)

rapporto = dim_mem / image_size;
% ottenuto un rapporto di 0.0898 (basso)(buono)

figure(5), clf, imshow(im2) % immagine con 400 colori
figure(6), clf, imshow(imabsdiff(im2, im)) % differenza tra originale e 500 colori
% anche qui si vede poco, vediamo quindi dove gli errori si concentrano
figure(7), clf, imagesc(max(imabsdiff(im2, im), [], 3)), colorbar

%% contenuto della consegna
% un archivio con dentro:
% - immagine di partenza (soprattutto se scaricata da internet)
% - file .m per encoding e decoding RLE
% - file .mat (o .txt, o .csv) contenente la vostra codifica e tutte le
% informazioni necessarie
% - calcolo del rapporto di compressione (dentro al file .m di
% encoding/decoding)