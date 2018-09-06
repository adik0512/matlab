function [ x, x1, n ] = licznosc2( X, Y )
    [x,y,z] = unique(X);
    [x1,y1,z1] = unique(Y);
    for i=1:length(x)
        for j =1:length(x1)
            n(i,j) = sum(z == i & z1 == j);
        end
    end   
end

