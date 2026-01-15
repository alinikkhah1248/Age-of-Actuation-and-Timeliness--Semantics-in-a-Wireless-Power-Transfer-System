clear
clc

load r

f=I_bar;
stepp=0.1;
rho_n=0.9;
q1_n=0.9;
q2_n=0.9;

stop=0.001;
x=[rho,q1,q2];
e=1;
i=1;
v=gradient(f,x);

while e > stop
i=i+1;
rho_o=rho_n;
q1_o=q1_n;
q2_o=q2_n;


v_s=double(subs(v,{rho,q1,q2},{rho_n,q1_n,q2_n}));



rho_n=double(rho_o-v_s(1)*stepp);
q1_n=double(q1_o-v_s(2)*stepp);
q2_n=double(q2_o-v_s(3)*stepp);

% if rho_n > 1
%     rho_n=1;
% elseif rho_n < 0 
%     rho_n=0;
% end
% 
% if q1_n > 1
%     q1_n=1;
% elseif q1_n < 0 
%     q1_n=0;
% end
% 
% if q2_n > 1
%     q2_n=1;
% elseif q2_n < 0 
%     q2_n=0;
% end


e=double(norm(v_s))
end
rho_n
q1_n
q2_n
f=double(subs(f,x,[rho_n,q1_n,q2_n]))

