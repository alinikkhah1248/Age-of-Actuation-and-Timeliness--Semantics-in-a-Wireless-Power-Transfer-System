function[T_e12_num]=T_e12(rho,gamma_e,g1,g2,upsilon_1,upsilon_2)

 
syms x y
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerical 

exp_=exp( - (gamma_e) / ((rho^2)*g1*upsilon_1)  );
exp_2=exp( - (gamma_e) / ((rho^2)*g2*upsilon_2)  );

T_e12_num= 1- (g2*upsilon_2*(exp_2-1)+g1*upsilon_1*(1-exp_))  / (g1*upsilon_1 - g2*upsilon_2) ;



end