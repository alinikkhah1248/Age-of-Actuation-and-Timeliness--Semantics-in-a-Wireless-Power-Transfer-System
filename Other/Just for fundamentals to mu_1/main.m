clc
clear

rho=0.8;

Noise_dbm=1.9;
Noise=(10^(Noise_dbm/10))*10^(-3);

gamma_dbm=-3;
gamma=(10^(gamma_dbm/10))*10^(-3);

gamma_e_dbm=-40;
gamma_e=(10^(gamma_e_dbm/10))*10^(-3);

P_t=5000*10^(-3);
radios=60;
alpha=4;
g1=P_t*(radios^(-alpha));

P_t_2=5000*10^(-3);
radios_2=100;
alpha_2=4;
g2=P_t_2*(radios_2^(-alpha_2));

upsilon_1=2;
upsilon_2=2.7;

N_i=1000000;

[T_d1_num,T_d1_sim]=T_d1 (Noise,gamma,g1,upsilon_1,N_i)
[T_d12_num,T_d12_sim]=T_d12(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2,N_i)
[T_e2_num,T_e2_sim]=T_e2(gamma_e,g2,upsilon_2,N_i)
[T_e12_num,T_e12_sim]=T_e12(rho,gamma_e,g1,g2,upsilon_1,upsilon_2,N_i)

