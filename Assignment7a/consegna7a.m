%% ESERCITAZIONE 7

im = imread("lena.bmp");
im = rgb2ycbcr(im);
y = im(:,:,1); % Y di YCBCR (a livello di grigio)

% trasformata coseno discreta
y_dct = dct2(y);
%figure(1), imagesc(log(1+abs(y_dct)))
% i valori più alti sono quelli nelle frequenze più basse (in alto a dx)
% i valori più bassi (zone scure) sono quelli nelle freq alte (basso a sx)

% Parametri di watermarking
L = 25000; % da che L del zigzag applicare il watermarking
M = 16000; % numero pseudo-casuali watermarking
alpha = 0.2; % aplha del watermarking

mark = randn(1000, M); % 1000 pattern di lunghezza M
X = mark(146, :); % 146esimo pattern di lunghezza : (M)

% calcolare dimensioni immagine (per passare da vettore zigzag a immagine)
S = size(y);

% lettura zig-zag (zigzag.m)

T = zigzag(y_dct);
T2 = T;

% watermark casting

for i=1:M
    T2(L+i) = T2(L+i)+(alpha*abs(T2(L+i))*X(i));
end

% lettura inversa zig-zag (ottengo dct dell'immagine watermarkata)

watermarked_image_dct = invzigzag(T2,S(1),S(2));

% trasformata inversa DCT

watermarked_image = idct2(watermarked_image_dct);

% salvare immagine con il watermark applicato

imwrite(uint8(watermarked_image), 'Lena_oltolini.bmp')

% salvo il file nella cartella 
copyfile Lena_oltolini.bmp Lena_X\

%% contenuto della consegna:
% archivio
% - immagine con watermark
% - watermark (x) --->  file .mat (save watermark X)
% - plot delle correlazioni (png) (7b)