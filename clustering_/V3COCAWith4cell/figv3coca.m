function figv3coca(x,MinPitsG,epG,index,ncm)

[m,n]=size(x);
y1=x;
ma=[];
z=0;
t3=0;
bcell={};
sb=[];
for a=1:ncm
    if epG(index(a))==0
        break;
    end
    [class,type]=DBSCAN(y1,MinPitsG(index(a)),epG(index(a)));
    ma1=max(class);
    disp('calss=');
    disp(class);
    le=length(class);    
    disp('le=');
    disp(le);
    t1=0;
    disp('a=');
    disp(a);
    y2=[];
    for i=1:le
        if class(i)==-1
            disp('i=');
            disp(i);
            t1=t1+1;
            y2(t1,:)=y1(i,:);
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if ma1~=-1
        z=z+1;
        ma(z)=ma1;
        for j=1:ma1
            t2=0;
            cl=find(class==j);
            t3=t3+1;
            for t=1:length(cl)
                t2=t2+1;
                bcell{t3}(t2,:)=y1(cl(t),:);
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    if ~isempty(y2)
        y1=y2;
    else
        break;
    end   
end
disp('bcell=');
celldisp(bcell);
disp('ma=');
disp(ma);
numberc=sum(ma);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axis([-5 5 -5 5 -5 5]);
grid on
xlabel('x');
ylabel('y');
zlabel('z');
hidden on
hold on
for i=1:numberc
    x=bcell{i}(:,1);
    y=bcell{i}(:,2);
    z=bcell{i}(:,3);
    if i<7
        co=dec2binvec(i,3);
        plot(x,y,'.','MarkerSize',5,'color',co);
    elseif i==7
        plot(x,y,'.','MarkerSize',5,'color',[0 .5 0]);
    elseif i==8
        plot(x,y,'.','MarkerSize',5,'color',[.5 0 0]);
    elseif i==9
        plot(x,y,'.','MarkerSize',10,'color',[.5 .5 .5]);
    elseif i==10
        plot(x,y,'.','MarkerSize',10,'color',[.5 .5 0]);
    elseif i==11
        plot(x,y,'.','MarkerSize',10,'color',[.5 0 .5]);
    elseif i==12
        plot(x,y,'.','MarkerSize',10,'color',[0 0 .5]);
    elseif i==13
        plot(x,y,'r+','MarkerSize',10);
    elseif i==14
        plot(x,y,'b+','MarkerSize',10);  
    end           
end
%ly=length(y1);
%x=y1(:,1);
%y=y1(:,2);
%for i=1:ly
    %plot(x,y,'.','MarkerSize',15,'color',[0 0 0]);  
%end
S=0;
b=size(bcell,2);
for i=1:b
    S=S+size(bcell{i},1);
    sb(i)=size(bcell{i},1);
end
noise=m-S;
disp('S=');
disp(S);
disp('number of noises=');
disp(noise);

disp('size of objects in clusters=');
disp(sb);
sf=[];
for i=1:b
    sf(i)=(sb(i)*100)/m;
end
disp('percent of clusters=');
disp(sf);
















end

