% carichiamo un immagine RGB
rgb = imread("beautifuldog.jpg");
imshow(rgb)

whos rgb  % immagine 631x960x3 bytes 1817280
% quindi x3 spazi colore R G B

R = rgb(:,:,1); %rgb è l'immagine non è un comando
G = rgb(:,:,2);
B = rgb(:,:,3);

figure
subplot(1,3,1), imshow(R), title("R")
% li vediamo in bianco e nero perché vediamo solo l'intensità
subplot(1,3,2), imshow(G), title("G")
subplot(1,3,3), imshow(B), title("B")

%proviamo a rimuovere G
rb = rgb;
% rb(:,:,2) = uint8(zeros(size(G))); % uint8 coerenza di tipo
rb(:,:,2) = 0;
figure, imshow(rb)

% im2double valori tra 0 e 1 (mapping?)
% im2uint8 valori tra 0 e 255

im1 = im2double(rgb); whos im1
im2 = im2uint8(im1); whos im2
figure
subplot(1,2,1), imshow(im1), title("im2double")
subplot(1,2,2), imshow(im2), title("im2uint8")
isequal(im1, rgb) % 0 = no

% convertire da rgb a gray
gray = rgb2gray(rgb); % dim: 631x960 (non abbiamo più la terza dimensione)
figure, imshow(gray) 

%% cambiare spazio colore --> YCbCr
close all
clc

rgb = imread("beautifuldog.jpg");
ycbcr = rgb2ycbcr(rgb);
whos ycbcr % 631x960x3 apparentemente uguale a rgb
figure,
subplot(1,2,1), imshow(ycbcr)
subplot(1,2,2), imshow(ycbcr2rgb(ycbcr))

% allora proviamo a modificare rgb
mrgb = rgb;
mrgb(:,:,2) = rgb(:,:,3);
mrgb(:,:,3) = rgb(:,:,2);
% invertita intensità del canale G con B e viceversa

% proviamo a modificare ycbcr
mycbcr = ycbcr;
mycbcr(:,:,2) = ycbcr(:,:,3);
mycbcr(:,:,3) = ycbcr(:,:,2);
% invertita crominanza cb con crominanza cr e viceversa

figure
subplot(1,3,1), imshow(mrgb), title("RGB modificata")
subplot(1,3,2), imshow(mycbcr), title("YCbCr modificata")
subplot(1,3,3), imshow(ycbcr2rgb(mycbcr)), title("YCbCr modificata 2 RGB")

% mettiamo a confronto i canali
figure
subplot(2,3,1), imshow(rgb(:,:,1)), title("R")
subplot(2,3,2), imshow(rgb(:,:,2)), title("G")
subplot(2,3,3), imshow(rgb(:,:,3)), title("B")
subplot(2,3,4), imshow(ycbcr(:,:,1)), title("Y")
subplot(2,3,5), imshow(ycbcr(:,:,2)), title("Cb")
subplot(2,3,6), imshow(ycbcr(:,:,3)), title("Cr")
% effettivamente in Y vediamo praticamente tutta l'intensità

% minimi e massimi R vs Y
[min(rgb(:,:,1), [], "all"), min(ycbcr(:,:,1), [], "all")] % 0 vs 16
[max(rgb(:,:,1), [], "all"), max(ycbcr(:,:,1), [], "all")] % 255 vs 235

% in generale (rappresentazione in 8 bit)
% Y tra 16 e 235
% Cb tra 16 e 240
% Cr tra 16 e 240

%% ISTOGRAMMI
close all
clear
clc

img = imread("beautifuldog.jpg");
gray = rgb2gray(img);

figure
subplot(1,2,1), imshow(gray), title("Immagine")
subplot(1,2,2), imhist(gray), title("Istogramma")

% analizziamo l'istogramma di ogni canale R G B
figure
counter = 1;
str = {'R', 'hist R', 'G', 'hist G', 'B', 'hist B'};
for i=1:3
    subplot(3,2,counter), imshow(img(:,:,i)), title(str{counter})
    counter = counter + 1;
    subplot(3,2,counter), imhist(img(:,:,i)), title(str{counter})
    counter = counter + 1;
end

%% QUANTIZZAZIONE
% per quantizzare  un'immagine dobbiamo passare da una grayscale image ad
% una indexed image (abbiamo bisogno della funzione grayslice)

close all
clear 
clc

img = imread("beautifuldog.jpg");
gray = rgb2gray(img);
levels = 4; % quantizziamo su 4 livelli
q4 = grayslice(gray, levels); % ecco qui grayslice

% per avere i corrispondenti livelli di grigio, dobbiamo moltiplicare gli
% indici concordentemente. Siccome abbiamo 4 livelli allora dividiamo i 256
% valori in 4 sezioni --> 256/4
q4 = q4 * (256/levels);
figure,
subplot(1,2,1), imshow(gray), title("grayscale")
subplot(1,2,2), imshow(q4), title("quantized with 4 levels")
% aumentando i livelli es.: da 4 a 16 otteniamo una qualità migliore

% Versione con colori (breve)
q = grayslice(img, levels) * (256/levels);
figure, imshow(q)

% Versione con colori (per ogni canale)
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

R = grayslice(R, levels) * (256/levels);
G = grayslice(G, levels) * (256/levels);
B = grayslice(B, levels) * (256/levels);

q = img;
q(:,:,1) = R; q(:,:,2)=G; q(:,:,3)=B;
figure, imshow(q)

q(:,:,2)=G.*1.5;
figure, imshow(q)

%% RICAMPIONAMENTO
%imresize

close all
clc

% interpolazione nearest-neighbor: al pixel di output viene assegnato il
% valore del pixel vicino. Nessun altro pixel viene considerato

% interpolazione bilinear: il pixel di output è una media pesata del pixel
% dell'intorno 2x2 più vicino

% interpolazione bicubic: il pixel di output è una media pesata in intorno
% 4x4

img = imread("beautifuldog.jpg");
figure, imshow(img), title('Originale')

% stabiliamo un fattore di ridimensionamento
k = 0.5; % piccolo, 1/4 dell'img originale

% nearest neighbour
small_near = imresize(img, k, "nearest");
% bilinear
small_bili = imresize(img, k, "bilinear");
% bicubic
small_bicu = imresize(img, k, "bicubic");
% small_bicu = imresize(img,k) bicubic default

figure, imshow(small_near), title("Nearest")
figure, imshow(small_bili), title("Bilinear")
figure, imshow(small_near), title("Bicubic")

