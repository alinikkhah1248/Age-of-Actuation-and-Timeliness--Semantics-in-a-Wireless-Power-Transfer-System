function[s]=T_e12_try(rho,gamma_e,g1,g2,upsilon_1,upsilon_2)
 

    A1=(raylrnd(sqrt(upsilon_1/2)))^2;
    A2=(raylrnd(sqrt(upsilon_2/2)))^2;
    
    if  (rho^2)*(g1*A1+g2*A2) >  gamma_e  
        s=1;
    else s=0;
    end
    


end