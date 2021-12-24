function V3COCA(x,xn,xt,input1)
%a=0;
%b=70;
%x= a + (b-a).*rand(10);
[m n]=size(x);
[acell,ac,si,DM]=partion(x,xn,xt);
%[bc ac]=size(acell);
%disp('ac=');
%disp(ac);
eps=zeros(1,ac);
alpha=.5;
%alpha=.1;
%alpha=1;
me=[];
MinPits=zeros(1,ac);
if isempty(input1)
    for z=1:ac
        minep=zeros(1,si(z));
        for j=1:si(z)
            g=DM{z}(:,j);
            if si(z)>1
                minep(j)=min(g(g>min(g)));
                %disp('dovominMIN=');
                %disp(minep(j));
            else
                 minep(j)=0;
            end
        end
        %disp('minep=');
        %disp(minep);
        eps(z)=sum(minep)/(alpha*si(z));  
    end
    disp('eps barabar ast ba=');
    disp(eps);
    for z=1:ac
        disp('number of cell=');
        disp(z);
        me=zeros(1,si(z));
        for j=1:si(z)
            for i=1:si(z)
                 %if j~=i
                 if DM{z}(i,j)<=eps(z)
                     me(j)=me(j)+1;
                 %end
                end
            end
        end
        disp('me=');
        disp(me);
        MinPits(z)=median(me);
        %disp('minpits(z)=');
        %disp(MinPits(z));
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%agar selloolha shamel sheye vorudi bashand.
else
    [a1 a2]=size(input1);
    objects={};
    result=zeros(1,ac);
    for z=1:ac
        j1=0;
        for i=1:a1
            for j=1:si(z)
                if input1(i,:)==acell{z}(j,:)
                    j1=j1+1;
                    objects{z}(1,j1)=j;
                    result(z)=1;
                    %result=1;
                    break;    
                end
            end 
        end 
        if ~result(z)
            objects{z}=[];
        end
    end
    disp('objects=');
    celldisp(objects);
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %be dast avardane eps va minpits
    for z=1:ac
        minep=zeros(1,si(z));
        if ~isempty(objects{z})
            %disp('sellul ba input');
            %disp(z)
            for i=1:length(objects{z})
                g=DM{z}(:,objects{z}(i));
                if si(z)>1
                    minep(objects{z}(i))=min(g(g>min(g)));
                    %disp('dovomimMIN=');
                    %disp(minep(objects{z}(i)));
                else
                    minep(objects{z}(i))=0;
                end
            end
            %disp('minepWithObjects=');
            %disp(minep);
            eps(z)=sum(minep)/(alpha*length(objects{z}));     
        else
            %disp('selluli ke input nadarad');
            %disp(z);
            for j=1:si(z)
                g=DM{z}(:,j);
                if si(z)>1
                    minep(j)=min(g(g>min(g)));
                    %disp('dovomin min baraye selluli ke input nadarad');
                    %disp(minep(j));
                else
                    minep(j)=0;
                end
            end
            %disp('minep baraye selluli ke input nadarad');
            %disp(minep);
            eps(z)=sum(minep)/(alpha*si(z));  
        end
    end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %be dast avardane minpits
    for z=1:ac
        if ~isempty(objects{z})
            %disp('sellul ba input=');
            %disp(z);
            me=zeros(1,length(objects{z}));
            for j=1:length(objects{z})
                for i=1:si(z)
                    if DM{z}(i,objects{z}(j))<=eps(z)
                        me(j)=me(j)+1;
                    end
                end
            end
            %disp('me=')
            %disp(me);
            MinPits(z)=floor(sum(me)/length(objects{z}))+1;
        else
            %disp('sellul bi input=');
            %disp(z);
            me1=zeros(1,si(z));
            for j=1:si(z)
                for i=1:si(z)
                    %if j~=i
                        if DM{z}(i,j)<=eps(z)
                            me1(j)=me1(j)+1;
                        end
                    %end
                end
            end
            %disp('me1=');
            %disp(me1);
            MinPits(z)=median(me1);
        end 
    end
   
     
       
end
disp('eps=');
disp(eps);
disp('MinPits=');
disp(MinPits);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%edghame eps va MinPits

temp=zeros(1,ac);
z=0;
t=0;
epG=[];
MinPitsG=[];
ace={};
newsi=[];
for i=1:(ac-1)
    if ~isempty(acell{i})
        if ~temp(i)
            temp(i)=1;
            disp('i=');
            disp(i);
            z=z+1;
            t=t+1;
            sum1=si(i)*eps(i);
            sum2=si(i);
            epG(z)=sum1/sum2;
            sum3=si(i)*MinPits(i);
            %MinPitsG(z)=floor((sum3/sum2))+1;
            if (sum3/sum2)<1
                MinPitsG(z)=floor(sum3/sum2)+1;
            else
                MinPitsG(z)=floor(sum3/sum2);  
            end
            newsi(z)=si(i);
            %ace{z}=[acell{i}];
            for j=i+1:ac
                if ~isempty(acell{j})
                    if ~temp(j)
                        if 1-(abs(eps(i)-eps(j))/(eps(i)+eps(j)))>.7
                            disp('j=');
                            disp(j);
                            sum1=sum1+si(j)*eps(j);
                            sum2=sum2+si(j);
                            epG(z)=sum1/sum2;
                            sum3=sum3+si(j)*MinPits(j);
                            %MinPitsG(z)=floor((sum3/sum2))+1;
                            if (sum3/sum2)<1
                                MinPitsG(z)=floor(sum3/sum2)+1;
                            else
                                MinPitsG(z)=floor(sum3/sum2);  
                            end
                            temp(j)=1;
                            newsi(z)=newsi(z)+si(j);
                            %ace{z}=[ace{z};acell{j}]; 
                        end  
                    end
                end
            end
        end
    end
end
if ~isempty(acell{ac})
    if ~temp(ac)
        z=z+1;
        disp('z=');
        disp(z);
        epG(z)=eps(ac);
        MinPitsG(z)=MinPits(ac);
        newsi(z)=si(ac);
        %ace{z}=[acell{ac}];   
    end
end
disp('newsi=');
disp(newsi);
disp('epG=');
disp(epG);
disp('MinPitsG=');
disp(MinPitsG);
%disp('ace=');
%celldisp(ace);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mohasebeye pi ha
ncm=length(epG);
p=zeros(1,ncm);
for i=1:ncm
    p(i)=newsi(i)/epG(i);
end
disp('p=');
disp(p);
[pnew,index]=sort(p,'descend');
disp('pnew=');
disp(pnew);
disp('index');
disp(index);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figv3coca(x,MinPitsG,epG,index,ncm);


end

