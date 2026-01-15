function[T_d12_num]=T_d12(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2)



%%%%%%%%%%%%
T_d12_num=exp(-(gamma*Noise)/((1-(rho^2))*upsilon_1*g1))  *  (1/(1+  gamma*((upsilon_2*g2)/(upsilon_1*g1))  )  );
%%%%%%%%%%%




end