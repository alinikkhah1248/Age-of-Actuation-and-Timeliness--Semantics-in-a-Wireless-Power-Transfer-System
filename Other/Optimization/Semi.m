function[CONVEX,CONCAVE]=Semi(H_I,rho,q1,q2)
% clc
% clear

neither=0;
Lin=0;
CONVEX=0;
CONCAVE=0;

for rho_=0.1:0.1:0.9
    rho_
    for q1_=0.1:0.1:0.9
     q1_
       for q2_=0.1:0.1:0.9
        q2_
           G_I_s=double(subs(H_I, {rho,q1,q2},{rho_,q1_,q2_}));
flag=Semi_positive(G_I_s);
if flag ==0
neither=neither+1;
elseif flag ==1
    CONVEX=CONVEX+1;
elseif flag==-1
    CONCAVE=CONCAVE+1;
else
    Lin=Lin+1;
end

       end
    end
end


end