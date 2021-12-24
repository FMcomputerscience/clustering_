function [D] =Dist(xi,xj,p)
d=0;
q=2;
mu=zeros(1,p);
mu(1,:)=.05;
%mu(1,:)=1;
%mu=[.1 .5];
for f=1:p
        d=d+mu(f)*(abs(xi(f)-xj(f)))^q;      
end
D=sqrt(d);
end




