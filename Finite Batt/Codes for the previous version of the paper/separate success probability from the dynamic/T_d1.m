function [T_d1_num,T_d1_sim] = T_d1 (Noise,gamma,g1,sigma,N)

upsilon=sigma^2;
%%%%%%%%%%%%
T_d1_num=exp(-(gamma*Noise)/(2*upsilon*g1));
% %%%%%%%%%%%%
s=0;

for k=1:N

    A1=(raylrnd(sigma))^2;
    
    if  (g1*A1)/(Noise) >  gamma 
        s=s+1;
    end
    
end
T_d1_sim=s/N;

end