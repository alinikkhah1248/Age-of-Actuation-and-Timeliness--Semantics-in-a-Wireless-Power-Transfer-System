function[T_d12_num]=T_d12(rho,Noise,gamma,g1,g2,sigma_1,sigma_2)


upsilon=sigma_1^2;
upsilon_2=sigma_2^2;


%%%%%%%%%%%%
T_d12_num=exp(-(gamma*Noise)/((1-(rho^2))*2*upsilon*g1))  *  (1/(1+  gamma*((2*upsilon_2*g2)/(2*upsilon*g1))  )  );
%%%%%%%%%%%




end