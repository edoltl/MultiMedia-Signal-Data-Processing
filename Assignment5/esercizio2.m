%% QUANTIZZAZIONE
% per quantizzare  un'immagine dobbiamo passare da una grayscale image ad
% una indexed image (abbiamo bisogno della funzione grayslice)

img = imread("beautifuldog.jpg");
figure, imshow(img)
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
figure, imshow(q), title("quantized RGB with 4 levels (short v)")

% Versione con colori (per ogni canale)
% ottengo singolarmente i canali
R = img(:,:,1); 
G = img(:,:,2);
B = img(:,:,3);
% graysliceo canale 
R = grayslice(R, levels) * (256/levels);
G = grayslice(G, levels) * (256/levels);
B = grayslice(B, levels) * (256/levels);

q2 = img;
q2(:,:,1) = R; q2(:,:,2)=G; q2(:,:,3)=B;
figure, imshow(q2), title("quantized RGB with 4 levels (long v)")
isequal(q, q2)

q3 = q2;
q3(:,:,2) = q2(:,:,2).*1.5;
figure, imshow(q3), title("quantized RGB with 4 levels (long v), G.*1.5")