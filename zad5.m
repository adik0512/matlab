A=[1 1 1; 
    2 1 -1;
    2 0 2]
[V D] = eigs(A)
 
wyznacznik=det(A)

S=V
B=inv(S)*A*V
wyznB=det(B)