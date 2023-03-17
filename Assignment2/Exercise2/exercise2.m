%% filtraggio immagine
im = imread("lena.bmp");
im = rgb2gray(im); % la convertiamo a livelli di grigio
im = im2double(im); % 0-255 to 0-1
figure(1),imshow(im),title("Lena Originale")

F = fft2(im); % trasformata bidimensionale
F = fftshift(F); % basse frequenze focalizzate al centro
figure(2), imagesc(20*log10(1+abs(F))) % in scala logaritmica

%% filtro notch
filtro = zeros(size(im));
[xx,yy] = meshgrid(1:512, 1:512);
D = sqrt((xx-256).^2+(yy-256).^2); % distanza pixel dal pixel centrale
filtro(D>=50)=1; % stiamo dentro la circonferenza di raggio 50
filtro(D<=25)=1;
figure(3), imagesc(filtro), title("Filtro Applicato")

Ff=filtro.*F;
imf=ifft2(ifftshift(Ff));
imf=real(imf);
figure(4),imshow(imf), title("Lena Filtrata");

neg_img = imcomplement(imf);
figure(5), imshow(neg_img), title("[Negativo]Lena Filtrata");

F = fft2(neg_img); % trasformata bidimensionale
F = fftshift(F); % basse frequenze focalizzate al centro
figure(6), imagesc(20*log10(1+abs(F))), title("Modulo FT Lena in Negativo (Filtrata)")
% in scala logaritmica

