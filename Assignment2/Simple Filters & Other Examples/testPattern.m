FS = 400; % frq di campionamento
D = 1*FS; % durata in sec di ogni sinusoide
% vogliamo che duri 1 sec ogni sinusoide
f = 5; %frq prima sinusoide (in Hz)
k = 1; %indice campione corrente

x = [];

while f<160
    for n=1:D
        x(k)=sin(2*pi*n*f/FS); %creazione del campione k del test pattern
        k = k+1;
    end
    f = f*2;
end

% otteniamo x di lunghezza 2000 -> siccome abbbiamo D = 400, abbiamo
% 5 sinusoidi una accodata all'altra, della stessa altezza in quanto le
% sinusoidi hanno la stessa ampiezza