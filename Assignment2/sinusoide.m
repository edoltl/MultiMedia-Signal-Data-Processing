function [x, n]=sinusoide(A,f0,phi,a,b)
%A ampiezza, f0 frequenza normalizzata, phi fase,
%[a, b]
n=a:b;
x=A*sin(2*pi*f0*n+phi);