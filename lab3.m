clc;
close;
clear all;

A = imread('lena.png');
A = double(A);

[xl, yl] = size(A);

%Lena roznicowa
rLena = zeros(512, 512);

rLena(1,1) = A(1,1);

for wiersz=2:yl
    rLena(wiersz,1) = A(wiersz,1) - A(wiersz-1,1);
end

for wiersz=1:yl
    for kolumna=2:xl
        rLena(wiersz,kolumna) = A(wiersz,kolumna) - A(wiersz,kolumna-1);
    end
end

%prawdopodobienstwo roznicowego
%Liczba kolorkow
kolorki = zeros(1, 512);

for i=1:512
    for j=1:512
        kolorki(rLena(i,j)+256) = kolorki(rLena(i,j)+256)+1;
    end
end

%Prawdopodobienstwo
for i=-255:255
    prawdopodobienstwo(1, i+256) = kolorki(1, i+256)./(512*512);
end

entropia = 0;

for i=-255:255
    if prawdopodobienstwo(i+256)~=0
        entropia = entropia + prawdopodobienstwo(1, i+256).*log2(prawdopodobienstwo(1, i+256));
    end
end
entropia = entropia .* (-1);


%pierdy Rice'a
n_podkreslone = zeros(512,512);
u = zeros(512,512);
v = zeros(512,512);
%R = zeros(512,512);

%Pierwsza metoda
for k=0:7

L_wekt=0;

    disp('Zaczynam');
    potega = 2.^k;
    for i=1:512
        for j=1:512
            if rLena(i,j) >= 0
                n_podkreslone(i,j) = 2*rLena(i,j);
            else
                n_podkreslone(i,j) = 2*abs(rLena(i,j))-1;
            end

            u(i,j) = floor(n_podkreslone(i,j)/potega);
            v(i,j) = n_podkreslone(i,j)-u(i,j).*potega;
            
            L_wekt = L_wekt + u(i,j) + 1 + k;
            
            tmp1 = dec2bin(u(i,j));
            tmp2 = dec2bin(v(i,j));
            tmp3 = strcat(tmp1, tmp2);
            R{i,j} = tmp3;
        end
    end
    disp(k);
    L(k+1) = L_wekt/8;
    L_srednie(k+1) = L_wekt./(512*512);
    
end




%Dekodowanie

