function [ bc ] =ucz_klasyfikator_bayesa( X,d, laplace )

if nargin == 2
    laplace = false;
else
    laplace = true;
end

[decs,ndecs] = licznosc(d);
bc.decs = decs';
bc.pdecs = ndecs' / sum(ndecs);

for i = 1:size(X,2)
    [xi, yi, ni] = licznosc2(X(:,i),d);
    bc.x{i} = xi;
    bc.nx{i} = ni;
    if laplace
        ni=ni+1;
    end
    bc.px{i} = ni./(ones(size(ni,1),1) *sum(ni));
%     else
%         bc.px{i} = ni./(ones(size(ni,1),1) *ndecs');
%     end
end



end

