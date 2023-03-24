# MultiMedia-Data&Signal-Processing
University Assignments for MMD&SP <br />
## Assignment 1: <br />
### Exercise 1: <br />
Create a new window function (different from finestra.m) called finestra_alt that allows <br />
to obtain this elementary signal using the step function (1-step). <br />
Test the efficiency of the function by creating a window between temporal stamps 3 and 14 <br />
inside the [0, 20] interval and compare it with the results obtained by applying the original finestra.m. <br />
If the result is the same, plot them in the same figure with their results. <br />
### Exercise 2: <br />
Applicare una finestra tra gli istanti 5 e 15 sul segnale sinusoide che abbia ampiezza pari a 2, <br />
frequenza normalizzata pari a 1/4, fase 0, istante di inizio e fine a 0 e 23. <br />
Rappresentare in un'unica figura il segnale originale e quello finestrato.
Calcolare la trasformata di Fourier per entrambi i segnali e rappresentarli in un'unica
figura sotto i relativi segnali nel dominio temporale. <br />
## Assignment 2: <br />
### Exercise 1: <br />
https://it.wikipedia.org/wiki/Dual-tone_multi-frequency <br />
I vecchi telefoni presentavano un sistema di codifica con segnali sonori chiamato dual-tone multi-frequency. <br />
Infatti ad un suono corrispondeva uno specifico numero. <br />
Nell’articolo collegato potete trovare la tabella delle frequenze DTMF. Aiutandovi con il materiale supplementare <br />
(supplementary.mlx), trovate la parola nascosta nel file audio2.wav. <br />
Non ci sono doppie nella parola che dovete trovare, quindi la ripetizione dei suoni è dovuta al fatto che <br />
si stia cercando una specifica lettera per creare il messaggio (ad es. schiacciando 2 volte 2 si ottiene la lettera B) <br />
Considerate la possibilità di usare un ciclo per poter analizzare tutti i suoni. <br />
La risoluzione dell’esercizio è in ogni caso a vostra discrezione. <br />
Scrivete a schermo il risultato della vostra decodifica (es. SOLE). <br />
### Exercise 2: <br />
Applicate all’immagine di Lena un filtro che consideri tutte le frequenze tranne quelle tra 25 e 50 Hz. <br />
Generate il negativo dell’immagine filtrata e visualizzatelo. <br />
Calcolate la trasformata di Fourier sul negativo e visualizzatene il modulo. <br />
## Assignment 3: <br />
Testing some filtering techniques with Poles & Zeros + K-Nearest Neighbor with Yes/No .wav datasets (using <br />
Fast Fourier Transform) <br />
The Assignment consisted of theoretical & semi-practical quizzes (elearning)
## Assignment 4: <br />
## Assignment 5: <br />
### Exercise 1: Working with YCbCr
Per la prima consegna dovrete produrre il file esercizio1.m nel quale riporterete il codice che vi consente <br />
di trovare i valori dinero e bianco nello spazio colore YCbCr. <br />
• Partite dall’immagine RGB beautifuldog.jpg. <br />
• Convertitela nello spazio colore YCbCr. <br />
• Trovate la tripletta di valori dei canali Y, Cb e Cr che corrispondono al nero ed al bianco. <br />
### Exercise 2: Quantization on R G B <br />
Nel file esercizio2.m provate a riprodurre l’immagine quantizzata di beautifuldog.jpg, ottenuta a lezione, <br />
ma quantizzando i singoli canali R, G e B. <br />
• Confrontate la nuova immagine con quella quantizzata durante la lezione. <br />
• Moltiplicate il secondo canale dell’immagine quantizzata per 1.5. <br />
Ricostruite l’immagine RGB e visualizzatela in una figura al fianco di quella originale. <br />
### Exercise 3: mp3
Nel file esercizio3.m, leggete il file sample1.mp3 e trovatene il peso in KB. <br />
• Confrontate il segnale risultante dalla lettura di sample1.wav con quello in formato mp3. <br />
• Se i segnali sono diversi, rappresentateli graficamente in un’unica figura ma in grafici separati. <br />
  Sull’asse delle x deve esserci il tempo in secondi. <br />
• Rallentate la traccia mp3 con un fattore a vostra scelta ed applicate un downsampling con fattore 20.<br />
Riproducete il suono.<br />
## Assignment6a: <br />
La Consegna #6a consiste nella creazione del video3 dall’unione di video1 e video2. <br />
## Assignment6b: <br />
La Consegna #6b consiste nella creazione di un video in cui sia presente l’effetto wagon wheel. <br />
## Assignment7a: <br />
La Consegna #7a consiste nell’applicazione dell’algoritmo analizzato a lezione per effettuare <br />
watermark casting e creare la propria immagine con watermark. <br />
## Assignment7b: <br />
La Consegna #7b consiste nell’applicazione dell’algoritmo analizzato a lezione per effettuare watermark detection <br />
e trovare la propria immagine con watermark analizzando tutte le immagini presenti nella cartella Lena_X.
Lena_X è un archivio .zip di immagini (sono immagini di Lena ottenute con watermark casting usando diversi set pseudocasuali) <br />
## Assignment8: <br />
### RLE encoding/decoding <br /> 
1. Scegliere un'immagine RGB adatta allo scopo. <br />
2. Preparare una mappa colori (selezionandoli a mano o effettuando un clustering dei colori). <br />
3. Creare l'immagine indicizzata, che sarà accompagnata dalla mappa preparata al punto 2. <br />
4. Applicare RLE <br />
5. Decodificare tenendo presente che avremo bisogno delle dimensioni di partenza delle immagini, la codifica RLE e la mappa dei colori. <br />
