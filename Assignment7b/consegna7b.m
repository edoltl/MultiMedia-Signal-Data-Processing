%% WATERMARK DETECTION
% per tutte le immagini di Lena_X

F = dir("Lena_X\*.bmp");
folder = F(1).folder; % tanto è uguale per tutti

load watermark; % per caricare il watermark X

correl_z = zeros(1,numel(F));
threshold_sz = zeros(1,numel(F));

for i=1:numel(F)
    path = strcat(folder, "/", F(i).name);
    img = imread(path);
    
    img_dct = dct2(img);
    T_star = zigzag(img_dct);

    z = 0;
    sz = 0;

    for j=1:M
        z = z + (X(j)*T_star(L+j));
        sz = sz + abs(T_star(L+j));
    end

    z = z / M;
    sz = (alpha/(3*M))*sz;

    correl_z(i) = z;
    threshold_sz(i) = sz;

end

figure, clc
plot(threshold_sz)
hold on
plot(correl_z)
hold off
legend({'threshold', 'z correlation'})

% abbiamo quindi un picco in 58 che corrisponde a Lena_oltolini.bmp