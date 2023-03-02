function [x,n] = finestra_alt(a,b,x0,x1)
n=a:b; % ascissa degli indici (campioni)
g1=gradino(a,b,x0); % creo un gradino che parte da x0
g2=gradino(a,b,x1+1); % creo un gradino che parte da x1+1
x=g1-g2; % differenza tra i due -> prendo l'intervallo