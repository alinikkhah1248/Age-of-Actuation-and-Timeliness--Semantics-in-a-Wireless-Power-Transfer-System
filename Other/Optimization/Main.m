clear
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Noise_dbm=-100;
Noise=(10^(Noise_dbm/10))*10^(-3);

gamma_dbm=-3;
gamma=(10^(gamma_dbm/10))*10^(-3);

gamma_e_dbm=-30;
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);

P_t=5*10^(-3);
radios=100;
alpha=4;
g1=P_t*(radios^(-alpha));

P_t_2=5*10^(-3);
radios_2=10;
alpha_2=4;
g2=P_t_2*(radios_2^(-alpha_2));

sigma_1=2;
sigma_2=2;

syms rho q1 q2

[T_d1_num]=T_d1 (Noise,gamma,g1,sigma_1);
[T_d12_num]=T_d12(rho,Noise,gamma,g1,g2,sigma_1,sigma_2);
[T_e2_num]=T_e2(gamma_e,g2,sigma_2);
[T_e12_num]=T_e12(rho,gamma_e,g1,g2,sigma_1,sigma_2);

P11_num=T_d1_num ;
P12_num=T_d12_num;
P22_num=T_e2_num;
P21_num=T_e12_num;



u1= q1*(q2*P12_num+(1-q2)*P11_num);
u2= q2*(q1*P21_num+(1-q1)*P22_num);



x1=q1*q2*P12_num*P21_num;
x2=q1*q2*P12_num*(1-P21_num)+q1*(1-q2)*P11_num;
x3=q1*q2*(1-P12_num)*P21_num+(1-q1)*q2*P22_num;
x4=(1-q1)*(1-q2)+q1*(1-q2)*(1-P11_num)+(1-q1)*q2*(1-P22_num)+q1*q2*(1-P12_num)*(1-P21_num);

xt=x3/x2;
empty_B=(1-xt)/(1-(xt^(m+1)));
non_empty_B=1-empty_B;

A0=(u1*non_empty_B)+(x1*empty_B);
I0=u1;

A_bar=1/A0;
I_bar=1/I0;
C_bar=empty_B*x2;

Ss=C_bar;  % Change here for Age or Actuation or cost

G_I=hessian(Ss,[rho,q1,q2]);
[Convex,Concave,Lin,neither]=Semi(G_I,rho,q1,q2)


% G_I_s=double(subs(G_I, {rho,q1,q2},{0.3,0.4,0.6}))
% 
% deter=det(G_I_s)
% 
% double(subs(deter,{rho,q1,q2},{0.3,0.4,0.6}))
