function [ x, y ] = licznosc( X )
    [x,y,z] = unique(X);
    len = length(x);
    for i=1:len,
       y(i) = sum(z == i); 
    end
end