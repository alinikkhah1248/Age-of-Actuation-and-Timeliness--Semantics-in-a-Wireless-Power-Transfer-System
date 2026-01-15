function[T_e2_num,T_e2_sim]=T_e2(gamma_e,g2,sigma_2)

upsilon_2=sigma_2^2;

%%%%%%%%%%%
T_e2_num=exp(-gamma_e/(g2*2*upsilon_2));
%%%%%%%%%%%%


end