A = [-5 -100 0 0; 
    0.5 -1.15 -1.1 0.15; 
    0 0 -0.04 0; 
    0 0.0055 0.0036 -0.0063];
Wyznacznik=det(A)
W=eig(A)
iloczyn = prod(W)
odwrotna=inv(A)
trojkatnad=triu(A)
trojkatnag=tril(A)
suma=trace(A)
