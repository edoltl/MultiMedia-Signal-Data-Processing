%% filtraggio immagine
clear all
clc
close all
im = imread("lena.bmp");
im = rgb2gray(im); % la convertiamo a livelli di grigio
im = im2double(im); % 0-255 to 0-1
figure(1),imshow(im)

F = fft2(im); % trasformata bidimensionale
% figure(5), imagesc(abs(F)) non si vede nulla
F = fftshift(F); % basse frequenze focalizzate al centro
figure(2), imagesc(20*log10(1+abs(F))) % in scala logaritmica

%%% esempio immagine sintetica
%[x, n] = sinusoide(1,1/4,0,0,23);
%im=repmat(x,24,1);
%im=(im+1)/2;
%figure(3),imshow(im)
%F = fft2(im);
%F = fftshift(F);
%figure(4), imagesc(20*log10(1+abs(F)))


%% filtro passa basso
filtro = zeros(size(im));
[xx,yy] = meshgrid(1:512, 1:512);
D = sqrt((xx-256).^2+(yy-256).^2); % distanza pixel dal pixel centrale
filtro(D<=50)=1; % stiamo dentro la circonferenza di raggio 50
figure(3), imagesc(filtro);

Ff=filtro.*F;
imf=ifft2(ifftshift(Ff));
imf=real(imf);
figure(4),imshow(imf)

filtro = 1-filtro;
Ff=filtro.*F;
imf=ifft2(ifftshift(Ff));
imf=real(imf);
figure(5),imshow(imf)