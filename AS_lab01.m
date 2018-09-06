clc
close all
clear all

x=1:2:11
y=0.01:0.01:0.06
z = [0.815 0.668 0.643 0.64  0.64  0.641;
     0.822 0.679 0.662 0.66  0.67  0.679;
     0.827 0.69  0.680 0.685 0.698 0.71;
     0.831 0.699 0.696 0.71  0.721 0.743;
     0.838 0.710 0.712 0.73  0.75  0.778;
     0.843 0.72  0.728 0.775 0.78  0.81];

  [X,Y] = meshgrid(x,y)

 plot3(X,Y,z,'.b')
 hold on;

 xp = reshape(X, 1, []);
 yp = reshape(Y, 1, []);
 zp = reshape(z, 1, []);
 d=length(xp);

 %przyk³ad 1
 Z1=[xp;yp;ones(1,d)];
 C1=zp*Z1'*inv(Z1*Z1');
 F1 = @(a,b) (C1(1)*a + C1(2)*b + C1(3));

 %przyk³ad 2
 Z2=[xp;yp;xp.*yp;ones(1,d)];
 C2=zp*Z2'*inv(Z2*Z2');
 F2 = @(a,b) (C2(1)*a + C2(2)*b + C2(3)*(a.*b) + C2(4));

 %przyk³ad 6
 Z6=[xp.*xp;yp.*yp;yp.*xp;ones(1,d)];
 C6=zp*Z6'*inv(Z6*Z6');
 F6 = @(a,b) (C6(1)*(a.*a) + C6(2)*(b.*b) + C6(3)*(a.*b) + C6(4));

 % przyk³ad 11
 Z11=[xp.*xp.*xp;xp.*xp;xp;yp.*yp;yp;ones(1,d)];
 C11=zp*Z11'*inv(Z11*Z11');
 F11 = @(a,b) (C11(1)*(a.*a.*a) + C11(2)*(a.*a) + C11(3)*a + C11(4)*(b.*b) + C11(5)*b + C11(6));

 xx=1:0.5:11;
 yy=0.01:0.002:0.06;
 [XX, YY] = meshgrid(xx, yy);

 %wyniki
 W = F1(XX, YY);
 W = F2(XX, YY);
 W = F6(XX, YY);
 W = F11(XX, YY);
 mesh(XX, YY, W)

 x1_1 = F1(2, 0.04);
 x1_2 = F1(8, 0.01);
 x1_3 = F1(10, 0.05);

 x2_1 = F2(2, 0.04);
 x2_2 = F2(8, 0.01);
 x2_3 = F2(10, 0.05);

 x6_1 = F6(2, 0.04);
 x6_2 = F6(8, 0.01);
 x6_3 = F6(10, 0.05);

 x11_1 = F11(2, 0.04);
 x11_2 = F11(8, 0.01);
 x11_3 = F11(10, 0.05);
