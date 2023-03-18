y = dir('./dataset_yes_no_small/yes/*.wav');
n = dir("dataset_yes_no_small\no\*.wav");

Y = zeros(100,1500); % 100 tracce lunghe 800
N = zeros(100,1500);

for ns=1:size(y,1)
    disp(num2str(ns))
    %%%% traccia YES
    [x, fs] = audioread([y(ns).folder filesep y(ns).name]);
    % fs = 16000 Hz per tutti quanti
    if size(x,1) < 16000
        x = [x; zeros(16000-size(x,1), 1)]; % tante righe, 1 colonna di zeri
    end
    F=fft(x);
    F=abs(F);
    F=F(1:8000);
    F=interp1(1:8000,F,linspace(1,8000,1500));
    Y(ns,:)=F;

    %%%% traccia NO
    [x, fs] = audioread([n(ns).folder filesep n(ns).name]);
    % fs = 16000 Hz per tutti quanti
    if size(x,1) < 16000
        x = [x; zeros(16000-size(x,1), 1)]; % tante righe, 1 colonna di zeri
    end
    F=fft(x);
    F=abs(F);
    F=F(1:8000); % solo frequenze positive
    F=interp1(1:8000,F,linspace(1,8000,1500)); % sotto campionamento
    N(ns,:)=F;
end

%% divisione train-test
% per il train: indici dispari
% per il test: indici pari

YL = ones(100, 1); % yes label
NL = zeros(100, 1); % no label
tr=[Y(1:2:end,:); N(1:2:end,:)];
trL=[YL(1:2:end); NL(1:2:end)];
te=[Y(2:2:end,:); N(2:2:end,:)];
teL=[YL(2:2:end); NL(2:2:end)];

%% classificazione vera e propria con k-nearest neighbor

D = pdist2(te, tr); %matrice delle distanze
% matrice 100x100 che per ogni traccia di test ci da la distanza da
% ogni traccia di training

[u, v] = min(D,[],2);
predicted = trL(v);
numel(find(predicted==teL))/numel(teL) % accuratezza del 70% con un
% sottocampionamento di 1500 (da 8000)