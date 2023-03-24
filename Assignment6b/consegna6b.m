%% VIDEO ALIASING

im0 = imread("bmw_wheel_184.jpg")+1; %+1 modo poco safe per togliere
% poi il nero
im0 = imresize(im0,0.8);

ngiri = 1; % numero di giri/sec della ruota
durata = 20; % durata video 5 secondi
angoli = ngiri*360*durata;
fps = 30;
frame_tot = fps*durata; % n frame totali
rotazioni = linspace(0,angoli,frame_tot);

writerObj = VideoWriter("provaAliasing.avi");
writerObj.FrameRate = fps;
open(writerObj)

k = 1;
j = 0;

for i=1:numel(rotazioni)
    j = j + 1;
    if j == 10
        j = 0;
        k = k + 0.5;
    end
    im=imrotate(im0,k*rotazioni(i), 'crop');
    im(im==0)=255;
    %figure(1), clf, imshow(im), drawnow
    writeVideo(writerObj, im);
end

% ho decisono di aumentare la quantità dell'angolo di rotazione ogni
% 10 rotazioni

close(writerObj)
