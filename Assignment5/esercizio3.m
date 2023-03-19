[x, fc] = audioread("sample1.mp3");
whos x
info = audioinfo("sample1.mp3");
t = info.Duration;

% calcolo bits per sample b

br = info.BitRate; % bit rate
sr = info.SampleRate; % sample rate
nc = info.NumChannels; % num of channels

b = br / (sr * nc);

%calcolo peso in KB
% weight = (fc * t * b * nc) / 8;
weight = (br / 8) * t

[y, fs] = audioread("sample1.wav");
isequal(y,x) % 0 --> false

% calcolo tempi in secondi
t1 = (0:size(x,1)-1)/fc;
t2 = (0:size(y,1)-1)/fs;

figure
subplot(1,2,1), plot(t1, x(:,1)), title("Segnale .mp3"),
xlabel("Tempo in Secondi"), ylabel("Ampiezza")
subplot(1,2,2), plot(t2, y(:,1)), title("Segnale .wav"),
xlabel("Tempo in Secondi"), ylabel("Ampiezza")

% Downsampling Factor = 20 + Slowing the .mp3 signal
slow = 0.3;
downsample = 20;
x2 = x(1:downsample:end, :);

out = stretchAudio(x2, slow);
sound(out,fs) % suono cursato