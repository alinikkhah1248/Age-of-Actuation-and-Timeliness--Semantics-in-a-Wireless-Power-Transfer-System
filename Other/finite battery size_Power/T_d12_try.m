function[s]=T_d12_try(rho,Noise,gamma,g1,g2,sigma_1,sigma_2)

upsilon=sigma_1^2;
upsilon_2=sigma_2^2;

    A1=(raylrnd(sigma_1))^2;
    A2=(raylrnd(sigma_2))^2;
    
    if  (g1*A1)/(g2*A2+(  Noise/(1-(rho^2)) ) ) >  gamma 
        s=1;
    else s=0;
    end


end