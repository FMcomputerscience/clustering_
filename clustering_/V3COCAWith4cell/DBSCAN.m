% -------------------------------------------------------------------------
% Function: [class,type]=dbscan(x,k,Eps)
% -------------------------------------------------------------------------
% Aim: 
% Clustering the data with Density-Based Scan Algorithm with Noise (DBSCAN)
% -------------------------------------------------------------------------
% Input: 
% x - data set (m,n); m-objects, n-variables
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
% -------------------------------------------------------------------------
% Output: 
% class - vector specifying assignment of the i-th object to certain 
% cluster (m,1)
% type - vector specifying type of the i-th object 
% (core: 1, border: 0, outlier: -1)
% -------------------------------------------------------------------------

function [class,type]=DBSCAN(x,k,Eps)

[m,n]=size(x);
x=[[1:m]' x];
[m,n]=size(x);
type=zeros(1,m);
class=zeros(1,m);
no=1;
touched=zeros(m,1);
%disp('eps=');
%disp(Eps);
for i=1:m
    if touched(i)==0;
       ob=x(i,:);
       %D=dist(ob(2:n),x(:,2:n));
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       for j=1:m
            D(1,j)=Dist(ob(2:n),x(j,2:n),n-1);
            %DM{z}(i,j)=D;
       end
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %disp('D=');
       %disp(D);
       ind=find(D<=Eps);
    
       if length(ind)>1 & length(ind)<k+1 
          type(i)=0;
          class(i)=0;
       end
       if length(ind)==1
          type(i)=-1;
          class(i)=-1; 
          touched(i)=1;
       end

       if length(ind)>=k+1; 
          type(i)=1;
          class(ind)=ones(length(ind),1)*max(no);
          
          while ~isempty(ind)
                ob=x(ind(1),:);
                touched(ind(1))=1;
                ind(1)=[];
                %D=dist(ob(2:n),x(:,2:n));
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                for j=1:m
                    D(1,j)=Dist(ob(2:n),x(j,2:n),n-1);
                    %DM{z}(i,j)=D;
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %disp('D2=');
                %disp(D);
                i1=find(D<=Eps);
     
                if length(i1)>1
                   class(i1)=no;
                   if length(i1)>=k+1;
                      type(ob(1))=1;
                   else
                      type(ob(1))=0;
                   end

                   for i=1:length(i1)
                       if touched(i1(i))==0
                          touched(i1(i))=1;
                          ind=[ind i1(i)]; 
                          class(i1(i))=no;
                       end 
                   end
                end
          end
          no=no+1; 
       end
    end
end
x1=x(:,1);
x2=x(:,2);
%x3=x(:,3);
%plot3(x1,x2,x3,'r.','MarkerSize',10);
i1=find(class==0);
class(i1)=-1;
type(i1)=-1;
