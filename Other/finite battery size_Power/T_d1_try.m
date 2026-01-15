function [s] = T_d1_try (Noise,gamma,g1,sigma)

upsilon=sigma^2;

A1=(raylrnd(sigma))^2;
    
    if  (g1*A1)/(Noise) >  gamma 
        s=1;
    else s=0;
    end

end