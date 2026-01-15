clc
clear
sig=3;

 ff=zeros(1,1000001);
 N=10000000;
 
for j=1:N
    rr=raylrnd(sig);
    r=rr^2;
       ff(round(100*r)+1)= ff(round(100*r)+1)+1;
end
d=sum(ff);
ff=ff/d;
f=ff(1:1001)
plot(0:0.01:10,f)