[x1, n] = finestra_alt(0,20,3,14);
[x2, n] = finestra(0,20,3,14);
if x1 == x2
    plot(n,x1,n,x2);
end