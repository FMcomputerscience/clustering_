function [x1,y1] = exa( )
%hold on
clear all
close all
clc
axis([-6 6 -6 6])
x=0;
y=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% r=6;
% ang=0:0.05:2*pi; 
% xp=r*cos(ang);
% yp=r*sin(ang);
% x1=xp;
% y1=yp;
% 
% r=5.9;
% ang=0:0.05:2*pi; 
% xp=r*cos(ang);
% yp=r*sin(ang);
% x1=xp;
% y1=yp;
% 
% r=5.8;
% ang=0:0.05:2*pi; 
% xp=r*cos(ang);
% yp=r*sin(ang);
% x1=xp;
% y1=yp;
% 
% r=5.7;
% ang=0:0.05:2*pi; 
% xp=r*cos(ang);
% yp=r*sin(ang);
% x1=[x1 xp];
% y1=[y1 yp];
% 
% r=5.6;
% ang=0:0.05:2*pi; 
% xp=r*cos(ang);
% yp=r*sin(ang);
% x1=[x1 xp];
% y1=[y1 yp];
% 
% r=5.4;
% ang=0:0.05:2*pi; 
% xp=r*cos(ang);
% yp=r*sin(ang);
% x1=[x1 xp];
% y1=[y1 yp];
%hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
r=4.5;
ang=0:0.05:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
x1=xp;
y1=yp;

r=4.4;
ang=0:0.05:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];


r=4.3;
ang=0:0.05:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];


r=4.2;
ang=0:0.05:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];

r=4.1;
ang=0:0.05:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];

r=4;
ang=0:0.05:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];

r=3.9;
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=3.8;
xp=r*cos(ang);
yp=r*sin(ang);
%plot(x+xp,y+yp,'.r');
x1=[x1 xp];
y1=[y1 yp];
%%%%%%%%%%%%%%%%%%%%%%%%%%5
r=3.7;
xp=r*cos(ang);
yp=r*sin(ang);
%plot(x+xp,y+yp,'.r');
x1=[x1 xp];
y1=[y1 yp];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=3.6;
xp=r*cos(ang);
yp=r*sin(ang);
%plot(x+xp,y+yp,'.r');
x1=[x1 xp];
y1=[y1 yp];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=3.5;
xp=r*cos(ang);
yp=r*sin(ang);
%plot(x+xp,y+yp,'.r');
x1=[x1 xp];
y1=[y1 yp];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=1;
xp=r*cos(ang);
yp=r*sin(ang);
%plot(x+xp,y+yp,'.b');
x1=[x1 xp];
y1=[y1 yp];
%%%%%%%%%%%%%%%%%%%%%%%%%
ang=0:0.1:2*pi; 
r=.9;
xp=r*cos(ang);
yp=r*sin(ang);
%plot(x+xp,y+yp,'.b');
x1=[x1 xp];
y1=[y1 yp];

ang=0:0.1:2*pi; 
r=.8;
xp=r*cos(ang);
yp=r*sin(ang);
%plot(x+xp,y+yp,'.b');
x1=[x1 xp];
y1=[y1 yp];

ang=0:0.1:2*pi; 
r=.7;
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];

ang=0:0.1:2*pi; 
r=.6;
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];

ang=0:0.1:2*pi; 
r=.5;
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];

ang=0:0.1:2*pi; 
r=.4;
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];

ang=0:0.1:2*pi; 
r=.3;
xp=r*cos(ang);
yp=r*sin(ang);
x1=[x1 xp];
y1=[y1 yp];


%plot(x+xp,y+yp,'.b');
disp('lengtgh=');
disp(length(x1));
disp(length(y1));
%plot(x1,y1,'.b');
disp(x1);


%[x1,y1]=exa();
%   x=xp';
%   y=yp';
%   x=[x y];
%  disp('size=');
%  disp(size(x));
% 
% 


end

