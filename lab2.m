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

colormap('gray');
image((rLena+128));

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

disp(entropia);

%Let's begin encoding
%rLena do dekodowania

LenaRecovered = zeros(512,512);
LenaRecovered(1,1) = rLena(1,1);

for wiersz=2:512
    LenaRecovered(wiersz,1) = LenaRecovered(wiersz-1,1) + rLena(wiersz,1);
end

for wiersz=1:512
    for kolumna=2:512
        LenaRecovered(wiersz,kolumna) = LenaRecovered(wiersz,kolumna-1) + rLena(wiersz,kolumna);
    end
end

figure;
colormap('gray');
image(LenaRecovered./4);
