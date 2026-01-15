function[T_d12_num]=T_d21(Noise,gamma_d2,g1,g2,upsilon_1,upsilon_2)



%%%%%%%%%%%%
T_d12_num=exp(-(gamma_d2*Noise)/(upsilon_2*g2))  *  (1/(1+  gamma_d2*((upsilon_1*g1)/(upsilon_2*g2))  )  );
%%%%%%%%%%%




end