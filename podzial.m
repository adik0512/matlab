function [ xu, du, xt, dt ] = podzial( X, d, a )
%Funkcja podzialu

p=size(X,1);
ind = randperm(p);

xu=X(ind(1:floor(a*p)), :);
xt=X(ind(1+floor(a*p):end),:);

du=d(ind(1:floor(a*p)), :);
dt=d(ind(1+floor(a*p):end),:);
end

