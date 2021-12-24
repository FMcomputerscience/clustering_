function [acell,ac,si,DM] = partion(x,xn,xt)
%disp(x);
[m n]=size(x);
j1=1;j2=1;j3=1;j4=1;j5=1;j6=1;
%acell=cell(m,1);
%xxp=[-.3 0 3 6];baraye matrise 70*2
%baraye dayerehaye to dar to
xxp=[-2 0 2 4.6];
%xxp=[-2 -1 0 1.5 3 4]
%xxp=[.3 .5 .7 1];
acell={};
xncell={};
xtcell={};
%ac=9;
if isempty(xn) && isempty(xt)
    for i= 1:m
    if x(i,1)<xxp(1)
        acell{1}(j1,:)=x(i,:);
        j1=j1+1;
    elseif  x(i,1)<xxp(2)
            acell{2}(j2,:)=x(i,:);
            j2=j2+1;
    elseif x(i,1)<xxp(3)
            acell{3}(j3,:)=x(i,:);
            j3=j3+1;
    elseif x(i,2)<xxp(4)
            acell{4}(j4,:)=x(i,:);
            j4=j4+1;
%     elseif x(i,2)<xxp(5)
%             acell{5}(j5,:)=x(i,:);
%             j5=j5+1;
%     elseif x(i,2)<xxp(6)
%             acell{6}(j6,:)=x(i,:);
%             j6=j6+1;
    end
    end
else
    for i= 1:m
    if x(i,1)<xxp(1)
        acell{1}(j1,:)=x(i,:);
        xncell{1}(j1,:)=xn(i,:);
        xtcell{1}(j1,:)=xt(i,:);
        j1=j1+1;
    elseif  x(i,1)<xxp(2)
            acell{2}(j2,:)=x(i,:);
            xncell{2}(j2,:)=xn(i,:);
            xtcell{2}(j2,:)=xt(i,:);
            j2=j2+1;
    elseif x(i,1)<xxp(3)
            acell{3}(j3,:)=x(i,:);
            xncell{3}(j3,:)=xn(i,:);
            xtcell{3}(j3,:)=xt(i,:);
            j3=j3+1;
    elseif x(i,2)<xxp(4)
            acell{4}(j4,:)=x(i,:);
            xncell{4}(j4,:)=xn(i,:);
            xtcell{4}(j4,:)=xt(i,:);
            j4=j4+1;
%     elseif x(i,2)<xxp(5)
%             acell{5}(j5,:)=x(i,:);
%             xncell{5}(j5,:)=xn(i,:);
%             xtcell{5}(j5,:)=xt(i,:);
%             j5=j5+1;
%     elseif x(i,2)<xxp(6)
%             acell{6}(j6,:)=x(i,:);
%             xncell{6}(j6,:)=xn(i,:);
%             xtcell{6}(j6,:)=xt(i,:);
%             j6=j6+1;
    end
    end
    
end
celldisp(acell);
[bc ac]=size(acell);
disp('ac=');
disp(ac);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
si=zeros(1,ac);
for j=1:ac
    [a1 a2]=size(acell{j});
    si(1,j)=a1;
end
disp(si);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
DM={};
for i=1:ac
    DM{i}=zeros(si(i));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%be dast avardan matrise fasele baraye har sellul
for z=1:ac
    for i=1:si(z)
        for j=1:si(z)
            if isempty(xn) && isempty(xt)
            D=Dist(acell{z}(i,:),acell{z}(j,:),n);
            DM{z}(i,j)=D;
            else
            D=Dist1(acell{z}(i,:),acell{z}(j,:),xncell{z}(i,:),xncell{z}(j,:),xtcell{z}(i,:),xtcell{z}(j,:),n);
            DM{z}(i,j)=D;
            end
        end
    end
end
celldisp(DM);


end

