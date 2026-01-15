function[s]=T_d12_try(rho,Noise,gamma,g1,g2,upsilon_1,upsilon_2)

    A1=(raylrnd(sqrt(upsilon_1/2)))^2;
    A2=(raylrnd(sqrt(upsilon_2/2)))^2;
    
    if  (g1*A1)/(g2*A2+(  Noise/(1-(rho^2)) ) ) >  gamma 
        s=1;
    else s=0;
    end


end