clear
% clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% q1=0.05;
% q2=0.05;
m=20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Noise_dbm=-100;
Noise=(10^(Noise_dbm/10))*10^(-3);

gamma_dbm=-3;
gamma=(10^(gamma_dbm/10))*10^(-3);

gamma_e_dbm=-30;
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);

P_t=5*10^(-3);
radios=20;
alpha=4;
g1=P_t*(radios^(-alpha));

P_t_2=5*10^(-3);
radios_2=10;
alpha_2=4;
g2=P_t_2*(radios_2^(-alpha_2));

sigma_1=2;
sigma_2=2;



%%%%%%%%%%%%%%%%%%%%%

for q1=0.01:0.01:1
q1

q2=0.01;
shart=1;
while shart==1  && q2 < 1.01 
    
syms rho
% 
% q1=q;
% q2=q+0.1;


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

A_bar=1/A0;

m_A=minimizer(A_bar);


if m_A < 0.99
shart=0;
AF_Bound(round(100*q1))=q2
end
q2=q2+0.01;
end

if shart==1
    AF_Bound(round(100*q1))=1;
end

end



                         