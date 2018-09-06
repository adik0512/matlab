clc
clear

img = imread('lena.png');

P = zeros(1,256);
E = 0;

w = size(img,1);
h = size(img,2);

for i = 1:256
    P(i) = sum(sum(img==i+1))/(w*h);
    if(P(i)>0)
        E = E - P(i) * log2(P(i));
    end
end

E

img_sub = int16(zeros(w,h));
img_sub(:,1) = img(:,1);

for i=2:h
    img_sub(:,i) = int16(img(:,i)) - int16(img(:,i-1));
    
    img_sub(i,1) = int16(img(i,1)) - int16(img(i-1,1)); 
end


P_sub = zeros(1,512+1);
E_sub = 0;

for i = -256:256
    P_sub(i+256+1) = sum(sum(img_sub==i+1))/(w*h);
    if(P_sub(i+256+1)>0)
        E_sub = E_sub - P_sub(i+256+1) * log2(P_sub(i+256+1));
    end
end

E_sub

for sposob=1:2
for m=2:20
% -- kod Golomba'a

disp(['Sposob: ' int2str(sposob) ', m = ' int2str(m)])

znak = zeros(w,h);

k = floor(log2(m));
L = int16(bitshift(2,k)) - m;

uv = boolean(zeros(1, 512*512*8));
len = 0;

% -- encode
for i = 1:w*h
    n = img_sub(i);

    switch (sposob)
        case 1
            if (n >= 0)
                n = 2 * n;
            else
                n = 2 * -n - 1;
            end
        case 2
            if (n >= 0)
                n = n;
                znak(i) = 0;
            else
                n = abs(n) - 1;
                znak(i) = 1;
            end
    end

    u = int16(floor(single(n)/m));
    v = n-u*m;

    if (v<L)
        tmp = [zeros(1,u) 1 de2bi(v,k,'left-msb')];
    else % v>=L
        tmp = [zeros(1,u) 1 de2bi(v+L,k+1,'left-msb')];
    end

    uv(len+1:len+length(tmp)) = tmp;
    len = len+length(tmp);
end

% -- end encode

% -- efektywnoœæ

p = sum(uv(1:len) == 0)/len;    % prawdopodobieñstwo wyst¹pienia 0
% H = -p * log2(p) - (1-p) * log2(1-p);
switch (sposob)
    case 1
        Lsr = len/(512*512);
    case 2
        Lsr = (len/(512*512)) + 1;
end
Ef = (E_sub/Lsr)*100;
disp(['Ef: ' num2str(Ef) ', Lsr = ' num2str(Lsr) ', len = ' int2str(len)])

% -- end efektywnoœæ

% -- decode
img_decoded = int16(zeros(w,h));

u = 0;
v = 0;
i = 1;
j = 1;

while i<=len
    if (uv(i) == 0)
        u = u + 1;
    else
        v = bi2de(uv(i+1:i+k),'left-msb');
        if (v>=L)
            v = (v*2 + uv(i+k+1)) - L;
            i = i + k + 1;
        else
            v = v;
            i = i + k;
        end
        n = u*m + v;

        switch (sposob)
           case 1
               if (bitget(abs(double(n)),1) == 0)
                   n = n/2;
               else
                   n = -((n + 1)/2);
               end
           case 2
               if (znak(j) == 0)
                   n = n;
               else
                   n = -(n + 1);
               end
        end

        img_decoded(j) = n;  
        j = j + 1;

        u = 0;
    end
    i=i + 1;
end

if (img_decoded == img_sub)
    disp('Obrazy zgodne');
else
    disp('Obrazy nie zgodne');
end;

% -- end decode

% -- end kod Golomba'a
end
end


img_re = int16(zeros(w,h));
img_re(1,1) = img_sub(1,1);

for i=2:h
    img_re(i,1) = img_re(i-1,1) + img_sub(i,1);
end

for i=2:w
    img_re(:,i) = img_re(:,i-1) + img_sub(:,i);
end

imshow(uint8(abs(img_sub)))
figure
imshow(uint8(abs(img_re)))


% zakodowaæ ró¿nicowo
% porównaæ entriopie
% odkodowaæ

% do sprawka dwa histogramy oryginalnego i ró¿nicowego

