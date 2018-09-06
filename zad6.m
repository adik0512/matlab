N=100;
x=linspace(-pi,pi,100);
y=linspace(11*pi,13*pi);

sinx2=zeros(1,100);
sinx3=zeros(1,100);
for j=1:100
    sinx=zeros(1,100);
    sinxs=zeros(1,100);
  for i=0:N-1
        sinx(i+1)=sum(sinx)+(((-1)^i)/factorial(2*i+1))*x(j)^(2*i);
        sinxs(i+1)=sum(sinx)+(((-1)^i)/factorial(2*i+1))*y(j)^(2*i);
  end
  sinx2(j)=sinx(100);
  sinx3(j)=sinxs(100);
end

subplot(2,1,1)
plot(x,sinx2);
subplot(2,1,2)
plot(y,sinx3);