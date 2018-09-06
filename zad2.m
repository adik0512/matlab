A = [1 1 2;
    2 1 4;
    3 0 6];
rzad=rank(A)
W=eig(A)
suma=sum(W)
wspolczynniki=poly(A)
pierwiastki=roots(wspolczynniki)
slad=trace(A)