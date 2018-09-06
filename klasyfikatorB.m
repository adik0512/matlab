%% wczytanie danych
% do wczytywania danych ...
addpath ReadArff
% addpath ./datasets-UCI/UCI/
[A, P, nc] = readArff('zoo.arff');
X=A(:,[2:13, 15:end-1]);
D=A(:,end);

alpha = logspace(-2,-0.3,10); %20 probek w zadanym przedziale, alpha w skali log

for i=1:length(alpha)
    blad(i) = tester(X,D,alpha(i),@ucz_klasyfikator_bayesa, @klasyfikacja);
    blad_lap(i) = tester(X,D,alpha(i),@ucz_klasyfikator_bayesa_lap, @klasyfikacja);
end
plot(alpha,blad, 'b')
hold on
plot(alpha,blad_lap, 'r')
legend('bez poprawki','z poprawka');
% licznosc(A(:,1))
% [a,b,c] = licznosc2(A(:,2), A(:,3))
%x = A(:,2:10)
%bc =ucz_klasyfikator_bayesa(A(:,2:10), A(:,end),true)
%[a,b,c] = klasyfikacja(bc,x)