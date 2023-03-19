%% WORKING WITH YCbCr

img = imread("beautifuldog.jpg");
ydog = rgb2ycbcr(img);

figure
counter = 1;
str = {'Y', 'hist Y', 'Cb', 'hist Cb', 'Cr', 'hist Cr'};

for i=1:3
    subplot(3,2,counter), imshow(ydog(:,:,i)), title(str{counter})
    counter = counter + 1;
    subplot(3,2,counter), imhist(ydog(:,:,i)), title(str{counter})
    counter = counter + 1;
end

[min(ydog(:,:,1), [], "all"), min(ydog(:,:,2), [], "all"), min(ydog(:,:,3), [], "all")]
[max(ydog(:,:,1), [], "all"), max(ydog(:,:,2), [], "all"), max(ydog(:,:,3), [], "all")] 