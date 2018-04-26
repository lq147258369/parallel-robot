clc
clear
close all
a = pi/3;
SA = 170;
L =130;
rp = 130;
rb = 290;
ca = cos(a);
sa = sin(a);
A=[];
B=[];
k=1;
r = 40:1:300-1;
theta = 0:pi/1800:2*pi-pi/1800;
for i=1:260
  for j = 1:3600
        PP1x = r(i)*cos(theta(j));
        PP1y = r(i)*sin(theta(j));
        PP2x = sqrt(3)*rp*ca+PP1x;
        PP2y = sqrt(3)*rp*sa+PP1y;
        PP3x = sqrt(3)*rp*cos(a+pi/3)+PP1x;
        PP3y = sqrt(3)*rp*sin(a+pi/3)+PP1y;
        PB2x = sqrt(3)*rb;
        PB2y = 0;
        PB3x = sqrt(3)*rb/2;
        PB3y = 1.5*rb;
        d2 = sqrt((PP2x-PB2x)^2 + (PP2y-PB2y)^2);
        d3 = sqrt((PP3x-PB3x)^2 + (PP3y-PB3y)^2);
        if 40<d2&&d2<300 && 40<d3&&d3<300
            xc = rp*cos(a+pi/6)+PP1x;
            yc = rp*sin(a+pi/6)+PP1y;
            A(k)=xc;
            B(k)=yc;
            k = k+1;
        
        end
 
        
        end
end
line([PB2x,PB3x],[PB2y,PB3y]);
line([0,PB3x],[0,PB3y]);
line([PB2x,0],[PB2y,0]);
hold on
plot(A,B,'.');

axis equal