function [x, n] = gradino(a,b,x0)
n=a:b;
x=zeros(size(n));
u=find(n>=x0);
x(u)=1;