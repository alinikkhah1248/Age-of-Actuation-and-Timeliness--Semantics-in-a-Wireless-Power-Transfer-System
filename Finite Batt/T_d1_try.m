function [s] = T_d1_try (Noise,gamma,g1,upsilon_1)


A1=(raylrnd(sqrt(upsilon_1/2)))^2;
    
    if  (g1*A1)/(Noise) >  gamma 
        s=1;
    else s=0;
    end

end