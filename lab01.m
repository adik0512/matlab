clear all
clc
close all

X = [ 6 0.4 15 70;
      14 0.6 13 40;
      17 0.4 15 80;
      14.5 0.7 11 50;
      20 1 10 40;
      21.6 1.2 10 50;
      23 1 7 80;
      24.5 1.5 6 100;
      28 1.5 8 110;
      26.4 1.7 5 80];
  
  Y = [14; 17; 14.5; 20; 21.6; 23; 24.5; 28; 26.4; 29];
  
  Z=[Y X]
  R=corrcoef(Z)
  R0=corrcoef([Y, X])
  
 

  %R01 = R01(1, 2)

  %A=R0(:, 5)
  
  %x1x2
  subplot(5,3,1);
  plot(X(:,1), X(:,2), '*g');
  title(sprintf('R= %f', R(2,3)))
  
  %x1x3
  subplot(5,3,2);
  plot(X(:,1), X(:,3), '*g');
  title(sprintf('R= %f', R(2,4)))
  
  %x1x4
  subplot(5,3,3);
  plot(X(:,1), X(:,4), '*g');
  title(sprintf('R= %f', R(2,5)))
  
  %x2x3
  subplot(5,3,4);
  plot(X(:,2), X(:,3), '*g');
  title(sprintf('R= %f', R(3,4)))
  
  %x2x4
  subplot(5,3,5);
  plot(X(:,2), X(:,4), '*g');
  title(sprintf('R= %f', R(5,3)))
  
  %x3x4
  subplot(5,3,6);
  plot(X(:,3), X(:,4), '*g');
  title(sprintf('R= %f', R(4,5)))
  
  %yyyyyyyyyyyyyyyyyyyyyyyyy
  
  subplot(5,3,10);
  plot(X(:,1), Y(:,1), '*b');
  title(sprintf('R= %f', R(2,1)))
  
  subplot(5,3,11);
  plot(X(:,2), Y(:,1), '*b');
  title(sprintf('R= %f', R(3,1)))
  
  subplot(5,3,12);
  plot(X(:,3), Y(:,1), '*b');
  title(sprintf('R= %f', R(4,1)))
  
  subplot(5,3,13);
  plot(X(:,4), Y(:,1), '*b');
  title(sprintf('R= %f', R(5,1)))
  
  %%%%%%% zerówki ###########
  
  for i=1:n
  kombinacje(i,:)=combnk(1:n,i)
  end

%   for i=1:size(R,2)-1
%    pierwsze_H(i,:)=R(i+1,1)^2/abs(R(i+1,i+1));
%   end
%   pierwsze_H
%   
%   %hkj=(R(1,2)^2)/(abs(R(2,2))+abs(R(2,3))+abs(R(2,4)))
%   licz=0
%   while licz<size(combnk(1:4,2),1)
%       licz=licz+1
%   for i=1:size(combnk(1:4,2),1)     %ilosc kombinacji bez powt (wektor, liczba losowanych elementow)
%   for j=1:2
%       if licz==3
%           i=2; j=1;
%       else if licz==2
%               i=3; j=1;
%           end
%       end
%       dr_H(i,j)=R(j+1,1)^2/abs(1+R(i+1,i+2))
%       H2(licz,:)=sum(dr_H(i,:))
%      
%       end
%  
%   end
%   end
%   H2
 
 %H1= 0.7990 H2=0.9455 H3=0.9704 H4=0.2212 
 %H5=0.9238 H6=0.9547 H7=0.6690 H8=0.9942 H9=0.7877 H10=0.8314 
 %H11=0.9762 H12=0.8404 H13=0.8733 H14=0.9193 
 %H15=0.9240

%1  x1
%2  x2
%3  x3
%4  x4
%5  x1 x2
%6  x1 x3
%7  x1 x4
%8  x2 x3
%9  x2 x4
%10 x3 x4
%11 x1 x2 x3
%12 x1 x2 x4
%13 x1 x3 x4
%14 x2 x3 x4
%15 x1 x2 x3 x4
  
  
  %R02
  %R03
  %R04
  
  


