%% ESERCIZIO 6A

% Apertura dei video di input
video1 = VideoReader('Francesca-Michelin---No-Degree-Of-Separation-Italy-Live-at-Semi-Final-2.mp4');
video2 = VideoReader('Jamala---1944-Ukraine-Live-at-Semi-Final-2-of-the-2016-Eurovision-Song-Contest.mp4');

% Creazione del video di output
video3 = VideoWriter('video3.avi');
video3.FrameRate = video1.FrameRate;
open(video3);

% Calcolo del numero totale di frame per la durata dei video
totalFrames1 = (video1.Duration*video1.FrameRate)-4000;
totalFrames2 = (video2.Duration*video2.FrameRate)-4000;
totalFrames3 = totalFrames1 + totalFrames2;

% Scorrimento dei frame di video1 fino alla metà di video1
for i = 1:floor(totalFrames1)
    frame = readFrame(video1);
    frame = imresize(frame,0.3);
    writeVideo(video3, frame);
end

% Scorrimento dei frame di video2 dalla metà del video2 fino alla fine
for i = floor(totalFrames2):totalFrames3
    frame = readFrame(video2);
    frame = imresize(frame,0.3);
    writeVideo(video3, frame);
end

% ho aggiunto i -4000 per ottenere i 10 MB massimi della consegna
% resize 0.3

% Chiusura del video di output
close(video3);