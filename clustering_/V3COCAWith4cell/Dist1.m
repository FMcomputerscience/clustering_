
function [D] =Dist1(xi,xj,xni,xnj,xti,xtj,p)
b=p;
r1=length(xni);
r2=length(xti);
p=b+r1+r2;
%disp('p=');
%disp(p);
d=0;
q=2;
mu=zeros(1,p);
%mu(1,:)=.05;
mu(1,:)=.1;
%mu(1,:)=1;
%mu=[.1 .5];
for f=1:b
        d=d+mu(f)*(abs(xi(f)-xj(f)))^q;      
end
z=b+1;
for f=1:r1 
        if xni(1,f)==xnj(1,f)
            d=d+mu(z);
        end
        z=z+1;
end
z=b+r1+1;
for f=1:r2
            d=d+mu(z)*abs(xti(1,f)-xtj(1,f));
            z=z+1;
end
D=sqrt(d);
end


