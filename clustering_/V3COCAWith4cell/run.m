clear all
close all
clc
tic
%x=[randn(30,2)*.4;randn(40,2)*.5+ones(40,1)*[4 4]];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xp={};
xt=zeros(1953,1);
for i=1:800
    xp{i,1}='blue';
    xp{i,2}='b';
    xt(i)=1;
end
for i=801:1300
    xp{i,1}='red';
    xp{i,2}='r';
    xt(i)=1;
end
for i=1301:1953
    xp{i,1}='yellow';
    xp{i,2}='y';
    xt(i)=0;   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xn=categorical(xp);
disp(xn);
disp(xt);
[x1,y1]=exa();
x=x1';
y=y1';
%l=rand(1953,1);
%save('l','l');
load l
x=[x y l];
disp(size(x));
%x=rand(1953,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%disp(x);

%disp('input1=');
%disp(input1);
%save('x','x');
%xn=[];
%xt=[];
%load x
%a=3;
%b=4;
%y=a+(b-a)*rand(100,3);
%x=rand(100,3);
% x=[x;y];
% disp(x);
% disp('x=');
% disp(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%we can have an input or we can use [] as our input, with both the algorithm
%will work.

%input1=[x(1,:);x(1953,:)];
input1=[];
V3COCA(x,xn,xt,input1);
toc
