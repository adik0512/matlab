clc;
close;
clear all;

A = imread('lena.png');
A = double(A);

kolorki = zeros(1, 256);

for i=1:512
    for j=1:512
        kolorki(A(i,j)) = kolorki(A(i,j))+1;
    end
end

%liczymy prawdopodobienstwo
prawdopodobienstwo = zeros(1,256);

for i=1:256
    prawdopodobienstwo(1, i) = kolorki(1, i)./(512*512);
end

%liczymy entropie zrodla
entropia = 0;

for i=1:256
    if prawdopodobienstwo(i)~=0
        entropia = entropia + prawdopodobienstwo(1, i).*log2(prawdopodobienstwo(1, i));
    end
end
entropia = entropia .* (-1);

disp(entropia);