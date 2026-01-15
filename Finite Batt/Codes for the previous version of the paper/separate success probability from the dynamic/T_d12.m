function[T_d12_num,T_d12_sim]=T_d12(rho,Noise,gamma,g1,g2,sigma_1,sigma_2,N)


upsilon=sigma_1^2;
upsilon_2=sigma_2^2;


%%%%%%%%%%%%
T_d12_num=exp(-(gamma*Noise)/((1-(rho^2))*2*upsilon*g1))  *  (1/(1+  gamma*((2*upsilon_2*g2)/(2*upsilon*g1))  )  );
%%%%%%%%%%%
s=0;
for k=1:N

    A1=(raylrnd(sigma_1))^2;
    A2=(raylrnd(sigma_2))^2;
    
    if  (g1*A1)/(g2*A2+(  Noise/(1-(rho^2)) ) ) >  gamma 
        s=s+1;
    end
    
end
T_d12_sim=s/N;



end