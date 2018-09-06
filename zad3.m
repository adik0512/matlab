A=[1 -1 2;
    2 1 -4;
    3 0 6]
wilomian=poly(A)
pierwiastki=roots(wilomian)

x=real(pierwiastki)
y=imag(pierwiastki)
plot(x,y,'r*')