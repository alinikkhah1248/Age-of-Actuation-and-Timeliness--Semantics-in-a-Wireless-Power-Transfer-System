function[s]=T_e2_try(gamma_e,g2,upsilon_2)

    A2=(raylrnd(sqrt(upsilon_2/2)))^2;
    
    if  g2*A2 >  gamma_e  
        s=1;
    else s=0;
    end

end