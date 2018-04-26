clc
%specify design parameters
Sa = 170;
L = 130;
Rp = 130;
Rb = 290;
%cartesian parameters£ºcoordnates of c and orientation of the platform a
x_c = 5;
y_c = 5;
a = pi/6;

%specify coordinates of joints PBi 
BPB = [Rb*cos(pi+pi/6),Rb*cos(2*pi-pi/6),0;Rb*sin(pi+pi/6),Rb*sin(2*pi-pi/6),Rb;0,0,0];
%define 3D rotation matrix(3*3)for the platform from a
Rot = [cos(a),-sin(a),0;sin(a),cos(a),0;0,0,1];
%Caculating the coordinate of PPi
CPP =  [-Rp*cos(pi/6),Rp*cos(pi/6),0;-Rp*sin(pi/6),-Rp*sin(pi/6),Rp;0,0,0];%2*3
BC = [x_c;y_c;0];%3*1
BPP = [Rot*CPP(:,1),Rot*CPP(:,2),Rot*CPP(:,3)] + [BC,BC,BC];%Each row symbols the coordinate of PPi(frame B)3*3
PBPP = BPP - BPB;%3*3
x_pp = PBPP(1,:);%a matrix of 1*3
y_pp = PBPP(2,:);%a matrix of 1*3

%Calculating theta, the parameters below are matrix of 1*3
e1 = -2*y_pp*Sa;
e2 = -2*x_pp*Sa;
e3 = x_pp.*x_pp + y_pp.*y_pp + Sa^2 - L^2;
t1 = [(-e1(1)+sqrt(e1(1)^2+e2(1)^2-e3(1)^2))/(e3(1)-e2(1)),(-e1(2)+sqrt(e1(2)^2+e2(2)^2-e3(2)^2))/(e3(2)-e2(2)),(-e1(3)+sqrt(e1(3)^2+e2(3)^2-e3(3)^2))/(e3(3)-e2(3))];
t2 = [(-e1(1)-sqrt(e1(1)^2+e2(1)^2-e3(1)^2))/(e3(1)-e2(1)),(-e1(2)-sqrt(e1(2)^2+e2(2)^2-e3(2)^2))/(e3(2)-e2(2)),(-e1(3)-sqrt(e1(3)^2+e2(3)^2-e3(3)^2))/(e3(3)-e2(3))];
theta1 = 2*atan(t1);
theta2 = 2*atan(t2);
theta = [theta1;theta2];

%find the position of Mi
M1 = [Sa*cos(theta1)+BPB(1,:);Sa*sin(theta1)+BPB(2,:)];%a matrix which is [x;y]
%M1 = [Sa*cos(theta2)+BPB(1,:);Sa*sin(theta2)+BPB(2,:)];
%Plot the the kiematic model
line([BPB(1,:),BPB(1,1)],[BPB(2,:),BPB(2,1)]);%base
hold on
line([BPP(1,:),BPP(1,1)],[BPP(2,:),BPP(2,1)]);%platform
hold on

line([BPB(1,1),M1(1,1)],[BPB(2,1),M1(2,1)]);
hold on
line([M1(1,1),BPP(1,1)],[M1(2,1),BPP(2,1)]);
hold on
line([BPB(1,2),M1(1,2)],[BPB(2,2),M1(2,2)]);
hold on
line([M1(1,2),BPP(1,2)],[M1(2,2),BPP(2,2)]);
hold on
line([BPB(1,3),M1(1,3)],[BPB(2,3),M1(2,3)]);
hold on
line([M1(1,3),BPP(1,3)],[M1(2,3),BPP(2,3)]);

axis equal
