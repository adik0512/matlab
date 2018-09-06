function [ dec, decs, pdecs ] = klasyfikacja( bc,x )
if size(x,1) == 1
  pdecs = bc.pdecs;
  for i=1:length(bc.x)
  ind = strcmp(bc.x{i},x{i});
  if sum(ind) == 1
    pdecs = pdecs.*bc.px{i}(ind,:);  
  else
    pdecs = pdecs*0.01;    
  end

  end  
  decs = bc.decs;
  [mp,ip] = max(pdecs);
  dec = decs(ip);
  pdecs = pdecs /sum(pdecs);
else
  dec = cell(size(x,1),1);
  pdecs = zeros(size(x,1),length(bc.decs));
  for i = 1:size(x,1)
      [ deci, decs, pdecsi ] = klasyfikacja(bc,x(i,:));
     dec(i) = deci;
     pdecs(i,:) = pdecsi;
  end
end
end

